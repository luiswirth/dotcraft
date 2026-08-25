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
      package = lib.mkDefault (pkgs.callPackage ./papermc.nix {});
      jvmOpts = lib.mkDefault "-Xmx4G -Xms4G";
      serverProperties = {
        motd = lib.mkDefault "dotcraft";
        max-players = lib.mkDefault 8;
        spawn-protection = lib.mkDefault 0;
      };
    };
  };
}
