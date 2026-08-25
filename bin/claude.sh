# Claude in Minecraft chat, over the two channels a server already has: it logs
# every chat line to the journal, and it reads commands from its stdin FIFO.
# MC_OPS, MC_CONSOLE and CLAUDE_BIN arrive from the systemd unit.

prefix='@claude'
turn_timeout=180
history_span=-1d
history_lines=40

# Anchored, not searched for: a message carrying its own "]: <someop>" would
# otherwise name whoever it likes, and the name is what decides privilege. A
# server that could not reach Mojang for the signing key marks every message
# [Not Secure], ahead of the name.
stamp='^\[[0-9]{2}:[0-9]{2}:[0-9]{2} [A-Z]+\]: (\[Not Secure\] )?'
chat_line="$stamp<([A-Za-z0-9_]{3,16})> (.+)$"
speech="$stamp(<[A-Za-z0-9_]{3,16}>|\[Server\]) "

# Writing to the console blocks for as long as nothing reads it, which is every
# moment the server is down.
console() {
  timeout 10 tee --append "$MC_CONSOLE" >/dev/null
}

# Status from the bridge, not conversation: tellraw reaches the players and is
# never logged, so it stays out of what the next turn reads back.
tell() {
  local color=$1 text=$2 component
  component=$(jq --compact-output --null-input --arg text "$text" --arg color "$color" \
    '["", {text: "[claude] ", color: "light_purple"}, {text: $text, color: $color}]')
  printf 'tellraw @a %s\n' "$component" | console
}

# An answer is speech, so it goes out as chat and is logged. That log is the
# whole memory of the conversation.
say() {
  local line
  while IFS= read -r line; do
    if [ -n "$line" ]; then
      printf 'say %s\n' "$line" | console
    fi
  done
}

# The console speaks only when the bridge or the model makes it, so [Server] is
# the model and is named as such.
history() {
  journalctl --unit minecraft-server --since "$history_span" --output cat |
    grep --extended-regexp "$speech" |
    sed --regexp-extended "s/$stamp//; s/^\[Server\] /<claude> /" |
    tail --lines "$history_lines"
}

is_operator() {
  jq --exit-status --arg name "$1" 'any(.[]; .name == $name)' "$MC_OPS" >/dev/null 2>&1
}

system_prompt() {
  cat <<EOF
You are in the chat of a private Minecraft server, as one of the people in it.
mcfn runs one server command and returns what the server logged; run as many as
the request takes. It is all you can do, and the world it acts on is the only
place your work lives.

Answer in at most three short lines of plain text, since chat renders no
markdown. Act on what is asked without asking first, and say what you did.

You are given the recent chat, oldest line first, and answer its last line.
Only an operator reaches you; anyone may be quoted above them.
EOF
}

# The allowlist is what runs without asking, and a turn that cannot be asked
# cannot answer, so nothing outside it acts.
claude_turn() {
  history | timeout "$turn_timeout" "$CLAUDE_BIN" \
    --print \
    --append-system-prompt "$(system_prompt)" \
    --allowed-tools "Bash(mcfn:*)"
}

handle() {
  local player=$1 message=$2 reply status=0

  case $message in "$prefix"*) ;; *) return ;; esac

  if ! is_operator "$player"; then
    tell red "$player is not an operator"
    return
  fi

  tell gray "thinking"
  reply=$(claude_turn) || status=$?
  case $status in
    0) printf '%s\n' "$reply" | say ;;
    124) tell red "still going after ${turn_timeout}s, ask again" ;;
    *) tell red "no answer, see journalctl -u dotcraft-claude" ;;
  esac
}

journalctl --unit minecraft-server --follow --lines 0 --output cat |
  while IFS= read -r line; do
    if [[ $line =~ $chat_line ]]; then
      handle "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"
    fi
  done
