# dotcraft

A private Minecraft server, and Claude in its chat.
Two NixOS modules in `nix/`, one per half.
See the README for the layout.

## Invariants

- **The server knows nothing of Claude:**
  `nix/claude.nix` reads `services.minecraft-server`, which nixpkgs provides
  and anything may have configured, so the dependency runs one way and stops there.
  What it does assume of the server it asserts.
- **A server command is the whole of what Claude can act with:**
  `mcfn <command>` sends one line to the console and returns what the server logged.
  A request that a command cannot express is not answered in chat,
  and reaching for a datapack, a plugin or a mod is a decision made here instead.
  Reading is not acting: the game's own wiki is open to a turn,
  because the syntax has moved since the model learned it.
- **Chat is the conversation and the memory:**
  A turn holds no state: it reads the recent chat back out of the journal and answers it.
  Speech goes out as `say`, so it is logged and the next turn sees it,
  where status goes out as `tellraw` and stays out of the record.
  What a turn learns goes to `storage dotcraft:memory` instead,
  which is world state and outlives both the chat and a deploy.
- **A running turn is reachable:**
  It reads its input from a FIFO under the runtime directory,
  and that FIFO existing is the whole of what says a turn is running,
  so a chat line arriving mid-turn goes into that turn rather than starting another.
- **The world is state and is not in this repository:**
  Blocks, entities and scoreboards outlive a restart and survive no revert.
  Nothing here can undo a command.
- **`nix/` deploys:**
  A change reaches the host only once dotnix bumps its lock,
  so nothing here is live the moment it is written.
- **The console is the server, standing at the world origin:**
  It has no position and no selves,
  so anything positional is wrapped in `execute at` or `execute as`,
  and anything else silently addresses a spot no player is standing on.
