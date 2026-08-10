# dotcraft

A private Minecraft server:
the datapacks its world loads, the history of how they got that way,
and the NixOS module that runs the whole thing.

The module runs Paper, symlinks `datapacks/` into the world,
and runs the bridge that puts Claude in the server's chat.
[dotnix](https://github.com/luiswirth/dotnix) imports it and names the host it runs on.
This repository is also the checkout that bridge edits, at `/srv/dotcraft` there.

## Chat

Two prefixes, told apart by who is allowed to use them.

    @claude  what does the compass do here
    @claude! give the compass a name and make it glow

`@claude` answers, and anyone can ask.
`@claude!` changes the datapacks, and only server operators can.
Privilege is read from the server's own `ops.json`,
so `/op` and `/deop` are all there is to it.

A change lands as a commit here, authored under the player who asked for it,
followed by a `/reload`.
Backing one out is `git revert` and another reload.

## Layout

    datapacks/<name>/    a datapack, loaded by the world under file/<name>
    nix/                 the NixOS module: the server, the bridge, mcfn

Everything belonging to this server lives here, one directory per concern,
so a datapack, a plugin and a bot are siblings rather than repositories of their own.

`/datapack list` in game shows what the world has actually enabled.
