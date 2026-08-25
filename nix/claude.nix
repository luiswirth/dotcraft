{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.dotcraft-claude;

  server = config.services.minecraft-server;

  # A FIFO in, the journal out, and that is the whole interface to a running
  # server. RCON would add a password, which a public flake has nowhere to keep.
  console = config.systemd.sockets.minecraft-server.socketConfig.ListenFIFO;

  scripts = pkgs.callPackage ./scripts.nix {};
in {
  options.services.dotcraft-claude = {
    enable = lib.mkEnableOption "Claude in the chat of a Minecraft server";

    user = lib.mkOption {
      type = lib.types.str;
      description = ''
        The user the service runs as: it spends their Claude credentials.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = server.enable;
        message = "services.dotcraft-claude reads a running minecraft-server.";
      }
      {
        assertion = (server.package.pname or null) == "papermc";
        message = "services.dotcraft-claude parses Paper's chat log format.";
      }
    ];

    # ops.json is where the server keeps privilege, and reading it is the whole
    # of how a speaker is trusted. These two are what let anyone but the server
    # get at it.
    systemd.services.minecraft-server.serviceConfig.UMask = lib.mkForce "0027";
    users.users.minecraft.homeMode = "0750";

    # Claude Code ships a generic-Linux binary, which needs nix-ld to run at
    # all. The service depends on it, so it asks for it rather than assuming
    # the host did.
    programs.nix-ld.enable = true;

    # minecraft for the console FIFO and ops.json, systemd-journal for the chat
    # lines.
    users.users.${cfg.user}.extraGroups = ["minecraft" "systemd-journal"];

    systemd.services.dotcraft-claude = {
      description = "Claude in Minecraft chat";
      wantedBy = ["multi-user.target"];
      after = ["minecraft-server.service"];
      bindsTo = ["minecraft-server.service"];
      # A turn is a full session, so the model gets what a login shell would
      # find and not the handful of tools a unit defaults to. Home Manager is a
      # NixOS module on this host, which puts the user's own packages under
      # /etc/profiles.
      path = [
        "/etc/profiles/per-user/${cfg.user}"
        "/run/wrappers"
        "/nix/var/nix/profiles/default"
        "/run/current-system/sw"
      ];
      serviceConfig = {
        ExecStart = lib.getExe scripts.dotcraft-claude;
        # Where a running turn keeps the FIFO it can be reached on. Emptied at
        # every start, so a turn cannot outlive the service that ran it.
        RuntimeDirectory = "dotcraft-claude";
        User = cfg.user;
        WorkingDirectory = config.users.users.${cfg.user}.home;
        Restart = "always";
        RestartSec = 5;
      };
      environment = {
        MC_OPS = "${server.dataDir}/ops.json";
        MC_CONSOLE = console;
        HOME = config.users.users.${cfg.user}.home;
        # Claude Code installs itself, so its path is not a store path, and the
        # binary it installs is a generic-Linux one that needs nix-ld. A unit
        # gets neither from the session variables a login shell would read.
        CLAUDE_BIN = "${config.users.users.${cfg.user}.home}/.local/bin/claude";
        inherit (config.environment.sessionVariables) NIX_LD NIX_LD_LIBRARY_PATH;
      };
    };
  };
}
