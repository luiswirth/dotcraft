{
  description = "A private Minecraft server: its datapacks, and Claude in its chat";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    # The bridge and mcfn read the journal and talk to systemd, so the server is
    # the only place they run.
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosModules.dotcraft = ./nix/module.nix;
    nixosModules.default = self.nixosModules.dotcraft;

    # Exposed so that the shell scripts get built, and so shellcheck runs on
    # them, without a host to deploy to.
    packages.${system} = {
      dotcraft-bridge = pkgs.callPackage ./nix/bridge.nix {};
      mcfn = pkgs.callPackage ./nix/mcfn.nix {};
    };

    formatter.${system} = pkgs.alejandra;
    formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.alejandra;
  };
}
