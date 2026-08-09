# dotcraft

Content for a private Minecraft server:
the datapacks its world loads, and the history of how they got that way.

The server itself is declared in [dotnix](https://github.com/luiswirth/dotnix),
which runs Paper, symlinks `datapacks/` into the world,
and runs the bridge that puts Claude in the server's chat.
This repository is the checkout that bridge edits, at `/srv/dotcraft` on the host.

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

`/datapack list` in game shows what the world has actually enabled.
