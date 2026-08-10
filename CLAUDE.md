# dotcraft

A private Minecraft server: its datapacks, edited from the server's own chat,
and the NixOS module in `nix/` that runs the server and the bridge doing the editing.
See the README for the layout and for what the chat prefixes mean.

## Invariants

- **A turn is a Claude Code session, and chat is its terminal:**
  Same model, same profile, same policy,
  and anything that session would put in front of its operator reaches the player.
  A failure only the journal hears is one nobody heard.
  Chat has no scrollback, so bulk output stays in the journal
  and chat carries the fact and where to look.
- **A datapack reloads, `nix/` deploys:**
  A change under `datapacks/` is live as soon as the server reloads,
  while one under `nix/` reaches the host only once dotnix bumps its lock and deploys.
  Never answer a chat request with a change the server has to be rebuilt to see.
- **Datapacks first, then a Paper plugin, and a mod last:**
  A datapack reloads in place and needs nothing of the client,
  a plugin costs a restart, and a mod costs every player an install.
  Reach for the next one only once the one before it cannot express the feature.
- **A feature is one namespace:**
  Its functions, tags and predicates share a directory
  and nothing outside it refers to them by name.
- **Only `minecraft:` tags reach out of a namespace:**
  Hooking into `load` and `tick` is how a feature starts;
  anything else naming another feature's function couples the two.
- **The world is state and is not in this repository:**
  Scoreboards, storage and placed blocks outlive a reload and survive no revert.
  A feature that cannot be undone by removing its files says so where it is declared.
- **Changes arrive live:**
  Players are connected while a reload happens,
  so a function that assumes it runs from a fresh world will not.

## Acting live

`mcfn <command>` sends one line to the server console.
It is how a request that acts on the world right now is answered,
where a file is how one that outlasts the moment is.

- **The console is the server, standing at the world origin:**
  It has no position and no selves,
  so anything positional is wrapped in `execute at` or `execute as`,
  and anything else silently addresses a spot no player is standing on.
- **The reply is whatever the server logged:**
  A question is asked by running the command that answers it,
  and one that logs nothing comes back empty after a short wait.
- **What it does is not in this repository:**
  A summoned entity or a granted effect survives a revert and a reload alike,
  and is undone by another command or not at all.

## Verifying

`/reload` applies a change and reports a failed function in chat.
`/datapack list` shows what the world enabled, which is not what this directory holds
until a reload says so.
