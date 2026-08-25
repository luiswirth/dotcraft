# dotcraft

A private Minecraft server, and Claude in its chat.

Two NixOS modules, one per half.
`services.dotcraft` is the server: Paper, and the settings this one runs with.
`services.dotcraft-claude` is the chat, and reads a `services.minecraft-server`
that anything may have configured.
[dotnix](https://github.com/luiswirth/dotnix) imports them and names the host they run on.

## Chat

    @claude make it rain and put a lit beacon on the hill

Only server operators are answered.
Privilege is read from the server's own `ops.json`,
so `/op` and `/deop` are all there is to it.

Claude can run server commands and nothing else,
so the answer to a request is whatever the world looks like afterwards.
Undoing one is another command, or nothing.

There is no session to start or clear.
Each request is answered against the last day of chat,
which the server logs and Claude speaks into like anyone else.

## Layout

    bin/claude.sh      the chat loop
    bin/mcfn.sh        one command to the console
    nix/server.nix     the server
    nix/papermc.nix    the server jar, which nixpkgs no longer keeps current
    nix/claude.nix     the service running the chat loop
    nix/scripts.nix    what packages the two
