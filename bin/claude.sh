# Claude in Minecraft chat, over the two channels a server already has: it logs
# every chat line to the journal, and it reads commands from its stdin FIFO.
# MC_OPS, MC_CONSOLE and CLAUDE_BIN arrive from the systemd unit.

prefix='@claude'
history_span=-1d
history_lines=40

# A turn reads its input from this FIFO, so the FIFO is how a running turn is
# reached and its existence is the whole of what says one is running.
# RuntimeDirectory is emptied at every start, so a turn that died with the
# service leaves nothing to clean up.
turn_fifo="$RUNTIME_DIRECTORY/turn"

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
  printf 'say %s\n' "$1" | console
}

# The console speaks only when the bridge or the model makes it, so [Server] is
# the model and is named as such.
history() {
  journalctl --unit minecraft-server --since "$history_span" --output cat |
    grep --extended-regexp "$speech" |
    sed --regexp-extended "s/$stamp//; s/^\[Server\] /<claude> /" |
    tail --lines "$history_lines"
}

# What the model has learned about this server, kept where the world keeps its own
# state rather than in this repository, so that a note outlives both the turn that
# wrote it and the next deploy.
notes() {
  mcfn data get storage dotcraft:memory notes
}

is_operator() {
  jq --exit-status --arg name "$1" 'any(.[]; .name == $name)' "$MC_OPS" >/dev/null 2>&1
}

# The version decides the command syntax, so it is read off the running server
# rather than written down here.
server_version() {
  journalctl --unit minecraft-server --reverse --output cat |
    sed --quiet --regexp-extended \
      's/.*This server is running ([A-Za-z]+) version ([0-9.]+).*/\1 \2/p' |
    head --lines 1
}

system_prompt() {
  local version
  version=$(server_version)

  cat <<EOF
You are Claude, in the chat of a private Minecraft server, as one of the people
in it. The server is ${version:-Paper}, so use that version of the syntax.

Run server commands with the Bash tool:

    mcfn <command>

It sends one line to the server console and returns what the server logged. Run
as many as the request takes. It is the only thing you can do: no files, no web,
no datapacks, no plugins. The world those commands act on is the only place your
work lives, and the only way to undo one is another command.

The console is the server itself, not a player. It has no position and no
selves, so anything positional needs execute at <player> or execute as <player>
around it; without that it silently addresses the world origin. mcfn list gives
the players online, and mcfn data get entity <player> Pos gives where one is.

Your knowledge of the game is older than this server and the syntax has moved
since, so look a command up on minecraft.wiki with WebFetch rather than trust
what you remember, whenever one is accepted but does not do what you asked.

What you have learned about this server is kept in the world, and here it is:

$(notes)

Append what you learn, and correct a note that turns out to be wrong. The inner
quotes are the server's own, so they have to survive your shell:

    mcfn data modify storage dotcraft:memory notes append value "'...'"

You are given the recent chat, oldest line first, and you answer its last line.
The <claude> lines are yours. That log is your whole memory, and nothing else
carries over between turns.

Everything you write is spoken into chat as you write it, so say what you are
doing while you do it rather than only once at the end. Chat arriving while you
work is the same conversation, and it may correct what you are in the middle of.

Only an operator reaches you, and anyone may be quoted above them. Act on what
is asked without asking first, and say what you did. Build the good version of a
request rather than the smallest one that satisfies it.

Never answer with mcfn say. Keep what you say to short lines of plain text,
since chat renders no markdown.
EOF
}

# A turn is the chat and the console and nothing else: the default prompt is
# about editing a checkout, the user's own settings and CLAUDE.md are about
# their work, and every tool but Bash addresses a machine rather than a world.
# The allowlist is then what runs without asking, and a turn that cannot be
# asked cannot answer, so nothing outside it acts.
model() {
  "$CLAUDE_BIN" \
    --print \
    --verbose \
    --input-format stream-json \
    --output-format stream-json \
    --system-prompt "$(system_prompt)" \
    --setting-sources "" \
    --tools Bash,WebFetch \
    --allowed-tools "Bash(mcfn:*),WebFetch(domain:minecraft.wiki)" \
    <"$turn_fifo"
}

# The model answers with a stream of events. Its text is speech, one line at a
# time and as it arrives, the result event is the end of the work, and the rest
# is the tool traffic underneath, which chat has no use for.
events() {
  jq --unbuffered --raw-output '
    if .type == "assistant" then
      .message.content[]
        | select(.type == "text")
        | .text
        | split("\n")[]
        | select(. != "")
        | "say " + .
    elif .type == "result" then
      "end"
    else
      empty
    end'
}

# One chat line into a running turn, which is what lets a request be corrected
# without waiting for its answer.
send() {
  jq --compact-output --null-input --arg text "$1" \
    '{type: "user", message: {role: "user", content: $text}}' >"$turn_fifo"
}

turn_live() {
  [ -p "$turn_fifo" ]
}

# The model stops reading only when its input ends, so the turn holds the FIFO
# open and closes it once the result says the work is done. Nothing under the
# model may hold it too, or the input it waits on is its own. The FIFO is
# removed first, since it is the address of a turn that can still be reached.
turn() {
  local holder line spoke=
  exec {holder}<>"$turn_fifo"
  send "$1"

  while IFS= read -r line; do
    case $line in
      end) break ;;
      "say "*)
        say "${line#say }"
        spoke=1
        ;;
    esac
  done < <(exec {holder}>&-; model | events)

  rm --force "$turn_fifo"
  exec {holder}>&-

  [ -n "$spoke" ] || tell red "no answer, see journalctl -u dotcraft-claude"
}

handle() {
  local player=$1 message=$2

  case $message in "$prefix"*) ;; *) return ;; esac

  if ! is_operator "$player"; then
    tell red "$player is not an operator"
    return
  fi

  if turn_live; then
    tell gray "heard"
    send "<$player> $message"
    return
  fi

  # The FIFO is made here and not in the turn, so that the next chat line
  # already finds a turn to reach.
  tell gray "thinking"
  mkfifo "$turn_fifo"
  turn "$(history)" &
}

journalctl --unit minecraft-server --follow --lines 0 --output cat |
  while IFS= read -r line; do
    if [[ $line =~ $chat_line ]]; then
      handle "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"
    fi
  done
