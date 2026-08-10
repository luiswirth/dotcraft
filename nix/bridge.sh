# Claude in Minecraft chat, over the two channels a server already has: it logs
# every chat line to the journal, and it reads commands from its stdin FIFO.
#
# Configuration arrives in the environment, from the systemd unit: MC_OPS,
# MC_CONSOLE, CLAUDE_BIN, STATE_DIRECTORY. The working directory is the
# dotcraft checkout.

prefix='@claude '

# One conversation, for as long as nobody clears it.
session="$STATE_DIRECTORY/session"

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

# Who is speaking belongs here rather than in front of the message, which is
# passed through untouched so that a slash command still leads the prompt.
system_prompt() {
  cat <<EOF
You are in the chat of a private Minecraft server, talking to its operators.
The working directory holds its datapacks and the module that runs the server.
Answer in at most three short lines of plain text, since chat renders no
markdown.

$1 is speaking. Act on what they ask without asking first. Run mcfn to act on
the live world and edit a datapack for anything that must outlast it; the
conventions for both are in CLAUDE.md. Do not reload or commit; that follows
your turn. Say what changed and how to try it.
EOF
}

claude_turn() {
  local player=$1 prompt=$2
  local id output
  local -a options=(
    --print
    --output-format json
    --append-system-prompt "$(system_prompt "$player")"
    # Chat is a terminal here, so a turn runs under the profile and policy a
    # terminal session would. claude/managed-settings.json in dotnix is where a
    # limit on it belongs, since its denials hold whatever the permission mode
    # says.
    --permission-mode bypassPermissions
  )

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
# the reload is what makes it visible without a restart.
apply() {
  local player=$1 request=$2
  git add --all
  git diff --cached --quiet && return

  git -c "user.name=$player" -c "user.email=$player@dotcraft" \
    commit --quiet --message "$request"
  timeout 30 git push --quiet ||
    tell red "committed but not pushed, see journalctl -u dotcraft-bridge"
  printf 'reload\n' | console
  tell gray "reloaded"
}

handle() {
  local player=$1 message=$2 prompt reply line

  case $message in
    "$prefix"*) prompt=${message#"$prefix"} ;;
    *) return ;;
  esac

  if ! is_operator "$player"; then
    tell red "$player is not an operator"
    return
  fi

  # The session is this file, so clearing it is the bridge's own business.
  # Every other slash command reaches Claude Code, which expands it.
  if [ "$prompt" = /clear ]; then
    rm --force "$session"
    tell gray "session cleared"
    return
  fi

  tell gray "thinking"
  local status=0
  reply=$(claude_turn "$player" "$prompt") || status=$?
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

  apply "$player" "$prompt"
}

journalctl --unit minecraft-server --follow --lines 0 --output cat |
  while IFS= read -r line; do
    if [[ $line =~ $chat_line ]]; then
      handle "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"
    fi
  done
