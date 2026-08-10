# Claude in Minecraft chat, over the two channels a server already has: it logs
# every chat line to the journal, and it reads commands from its stdin FIFO.
#
# Configuration arrives in the environment, from the systemd unit: MC_OPS,
# MC_CONSOLE, CLAUDE_BIN, STATE_DIRECTORY. The working directory is the
# dotcraft checkout.

ask_prefix='@claude '
dev_prefix='@claude! '

# A turn that stops answering is indistinguishable from one still thinking, so
# it is given a bound rather than a player waiting on it forever. The session
# outlives the bound, so the next turn picks a cut one up where it stopped.
turn_timeout=600

# The line is matched from its start rather than searched for. A message
# carrying its own "]: <someop>" would otherwise name whoever it likes, and the
# player name is what decides privilege. A server that could not reach Mojang
# for the signing key marks every message unsigned, ahead of the name.
chat_line='^\[[0-9]{2}:[0-9]{2}:[0-9]{2} [A-Z]+\]: (\[Not Secure\] )?<([A-Za-z0-9_]{3,16})> (.+)$'

# Writing to the console blocks for as long as nothing reads it, which is every
# moment the server is down.
console() {
  timeout 10 tee --append "$MC_CONSOLE" >/dev/null
}

# tellraw writes to the players and nothing else, so a reply that arrived leaves
# no trace in the journal the bridge itself is reading.
tell() {
  local color=$1 text=$2 component
  component=$(jq --compact-output --null-input --arg text "$text" --arg color "$color" \
    '["", {text: "[claude] ", color: "light_purple"}, {text: $text, color: $color}]')
  printf 'tellraw @a %s\n' "$component" | console
}

# Operator status is the server's own notion of privilege, so it is read from
# where the server keeps it rather than mirrored into a list of our own.
is_operator() {
  jq --exit-status --arg name "$1" 'any(.[]; .name == $name)' "$MC_OPS" >/dev/null 2>&1
}

system_prompt() {
  cat <<'EOF'
You are in the chat of a private Minecraft server. The working directory holds
its datapacks. Answer in at most three short lines of plain text, since chat
renders no markdown.
EOF

  # The guidelines a session here inherits are written for pairing, and would
  # have it wait for a go-ahead that chat has no way to give.
  case $1 in
    ask)
      cat <<'EOF'
You can read and answer, nothing else. Say so rather than attempting a change.
EOF
      ;;
    dev)
      cat <<'EOF'
An operator asked for a change. Make it, without asking first. Run mcfn to act
on the live world and edit a datapack for anything that must outlast it; the
conventions for both are in CLAUDE.md. Do not reload or commit; that follows
your turn. Say what changed and how to try it.
EOF
      ;;
  esac
}

session_file() {
  printf '%s/session-%s\n' "$STATE_DIRECTORY" "$1"
}

claude_turn() {
  local tier=$1 prompt=$2
  local session id output
  session=$(session_file "$tier")
  local -a options=(
    --print
    --output-format json
    --append-system-prompt "$(system_prompt "$tier")"
  )

  # A dev turn is a terminal session in everything but the chat around it: same
  # model, same profile, same policy. The tailnet is the trust boundary, and
  # claude/managed-settings.json in dotnix is where a limit on it belongs, since
  # its denials hold whatever the permission mode says. The tier open to
  # everyone else only reads.
  case $tier in
    ask) options+=(--allowedTools "Read,Grep,Glob") ;;
    dev) options+=(--permission-mode bypassPermissions) ;;
  esac

  # The session is the privilege boundary, one conversation per tier: chat is a
  # shared room, so a follow-up reads as one, but anybody may write into the ask
  # context and a dev turn acts on its own with the server's full authority.
  #
  # The bridge names the session rather than reading it back afterwards, so a
  # turn that is cut short still leaves one behind to resume.
  if [ -s "$session" ]; then
    id=$(cat "$session")
    options+=(--resume "$id")
  else
    id=$(uuidgen)
    printf '%s' "$id" >"$session"
    options+=(--session-id "$id")
  fi

  # The prompt goes in over stdin: as an argument, a message opening with a
  # dash would be read as a flag.
  local status=0
  output=$(printf '%s' "$prompt" |
    timeout "$turn_timeout" "$CLAUDE_BIN" "${options[@]}") || status=$?
  # timeout's own exit code, passed through so that the wait and the failure
  # read differently in chat.
  [ "$status" -eq 0 ] || return "$status"

  jq --exit-status --raw-output 'select(.is_error | not) | .result' <<<"$output"
}

# The bridge commits, pushes and reloads, not the model: the commit is what
# makes a change revertible, the push is what makes it outlive the machine, and
# the reload is what makes it visible without a restart. The push is the only
# one of the three a player is not told about, being nobody's business but the
# journal's when it fails.
apply() {
  local player=$1 request=$2
  git add --all
  git diff --cached --quiet && return

  git -c "user.name=$player" -c "user.email=$player@dotcraft" \
    commit --quiet --message "$request"
  timeout 30 git push --quiet
  printf 'reload\n' | console
  tell gray "reloaded"
}

handle() {
  local player=$1 message=$2 tier prompt reply line

  case $message in
    "$dev_prefix"*) tier=dev prompt=${message#"$dev_prefix"} ;;
    "$ask_prefix"*) tier=ask prompt=${message#"$ask_prefix"} ;;
    *) return ;;
  esac

  if [ "$tier" = dev ] && ! is_operator "$player"; then
    tell red "$player is not an operator"
    return
  fi

  # A tier is one conversation for as long as nobody ends it, and chat spells
  # ending one the way a terminal does.
  if [ "$prompt" = /clear ]; then
    rm --force "$(session_file "$tier")"
    tell gray "$tier session cleared"
    return
  fi

  tell gray "thinking"
  local status=0
  reply=$(claude_turn "$tier" "$player asks: $prompt") || status=$?
  case $status in
    0) ;;
    124)
      tell red "still going after ${turn_timeout}s, ask again to pick it up"
      return
      ;;
    *)
      tell red "no answer, see journalctl -u dotcraft-bridge"
      return
      ;;
  esac

  while IFS= read -r line; do
    [ -n "$line" ] && tell white "$line"
  done <<<"$reply"

  if [ "$tier" = dev ]; then
    apply "$player" "$prompt"
  fi
}

journalctl --unit minecraft-server --follow --lines 0 --output cat |
  while IFS= read -r line; do
    if [[ $line =~ $chat_line ]]; then
      handle "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"
    fi
  done
