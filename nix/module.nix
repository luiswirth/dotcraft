{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.dotcraft;

  dataDir = config.services.minecraft-server.dataDir;

  # A FIFO in, the journal out, and that is the whole interface to a running
  # server. RCON would add a password, which a public flake has nowhere to keep.
  console = config.systemd.sockets.minecraft-server.socketConfig.ListenFIFO;

  bridge = pkgs.callPackage ./bridge.nix {};

  # A world is validated on load and a symlink out of it refuses to open unless
  # its target was named here first.
  allowedSymlinks = pkgs.writeText "allowed_symlinks.txt" "[prefix]${cfg.contentDir}\n";
in {
  options.services.dotcraft = {
    enable = lib.mkEnableOption "the dotcraft Minecraft server and the bridge putting Claude in its chat";

    user = lib.mkOption {
      type = lib.types.str;
      description = ''
        Owner of the checkout, and the user the bridge runs as: it spends their
        Claude credentials and commits under their name.
      '';
    };

    contentDir = lib.mkOption {
      type = lib.types.path;
      default = "/srv/dotcraft";
      description = ''
        The dotcraft checkout, outside /home because the server unit runs under
        ProtectHome. A working tree rather than a store path, because the server
        and the model both write it.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;
      declarative = true;
      # Paper runs vanilla datapacks and takes plugins, and vanilla clients
      # still connect. The bridge's chat parsing follows its log format.
      package = lib.mkDefault pkgs.papermc;
      jvmOpts = lib.mkDefault "-Xmx4G -Xms4G";
      serverProperties = {
        motd = lib.mkDefault "dotcraft";
        max-players = lib.mkDefault 8;
        spawn-protection = lib.mkDefault 0;
      };
    };

    # The bridge reads ops.json, which the server writes under this umask.
    systemd.services.minecraft-server.serviceConfig.UMask = lib.mkForce "0027";

    # ops.json sits under the server user's home, whose mode every activation
    # puts back to whatever this says.
    users.users.minecraft.homeMode = "0750";

    systemd.tmpfiles.rules = [
      "d ${cfg.contentDir} 0755 ${cfg.user} users - -"
      "d ${dataDir}/world 0750 minecraft minecraft - -"
      # One pack, and the server keeps the directory holding it: Paper writes a
      # pack of its own in there. Features are namespaces inside this one.
      "d ${dataDir}/world/datapacks 0750 minecraft minecraft - -"
      "L+ ${dataDir}/world/datapacks/dotcraft - - - - ${cfg.contentDir}/datapacks/dotcraft"
      "L+ ${dataDir}/allowed_symlinks.txt - - - - ${allowedSymlinks}"
    ];

    # minecraft for the console FIFO and ops.json, systemd-journal for the chat
    # lines.
    users.users.${cfg.user}.extraGroups = ["minecraft" "systemd-journal"];

    systemd.services.dotcraft-bridge = {
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
        ExecStart = lib.getExe bridge;
        User = cfg.user;
        StateDirectory = "dotcraft-bridge";
        # The bridge commits here, and the model inherits it as its own.
        WorkingDirectory = cfg.contentDir;
        Restart = "always";
        RestartSec = 5;
      };
      environment = {
        MC_OPS = "${dataDir}/ops.json";
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
