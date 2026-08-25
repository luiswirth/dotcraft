# One command, spoken to the running server. MC_CONSOLE is the same FIFO the
# service writes to, and the journal is where the server answers, so the reply
# is whatever it logged after the line went in.

cursor=$(journalctl --unit minecraft-server --lines 1 --show-cursor --output cat | tail -1)
cursor=${cursor#-- cursor: }

printf '%s\n' "$*" | timeout 10 tee --append "$MC_CONSOLE" >/dev/null

# A command that answers nothing looks like one whose answer has not arrived
# yet, so the wait is bounded and an empty reply is a reply.
for _ in {1..20}; do
  reply=$(journalctl --unit minecraft-server --after-cursor "$cursor" --output cat)
  if [ -n "$reply" ]; then
    break
  fi
  sleep 0.1
done
printf '%s\n' "$reply"
