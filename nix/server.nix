{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.services.dotcraft;
in {
  options.services.dotcraft.enable =
    lib.mkEnableOption "the dotcraft Minecraft server";

  config = lib.mkIf cfg.enable {
    services.minecraft-server = {
      enable = true;
      eula = true;
      declarative = true;
      package = lib.mkDefault pkgs.papermc;
      jvmOpts = lib.mkDefault "-Xmx4G -Xms4G";
      serverProperties = {
        motd = lib.mkDefault "dotcraft";
        max-players = lib.mkDefault 8;
        spawn-protection = lib.mkDefault 0;
      };
    };

    # network.target promises only that the stack is configured, so the server
    # can win the race against a usable link and fail to fetch Mojang's chat
    # signing key. It carries on unsigned, and marks every message it then
    # cannot verify [Not Secure], for as long as it runs.
    systemd.services.minecraft-server = {
      wants = ["network-online.target"];
      after = ["network-online.target"];
    };
  };
}
