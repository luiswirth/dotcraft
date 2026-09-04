{
  description = "A private Minecraft server, and Claude in its chat";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    nixpkgs,
    treefmt-nix,
    ...
  }: let
    # The service and mcfn read the journal and talk to systemd, so the server
    # is the only place they run.
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    forEachSystem = f:
      nixpkgs.lib.genAttrs ["aarch64-darwin" "x86_64-linux"]
      (system: f nixpkgs.legacyPackages.${system});
  in {
    nixosModules.dotcraft = ./nix/server.nix;
    nixosModules.dotcraft-claude = ./nix/claude.nix;

    # Exposed so that the shell scripts get built, and so shellcheck runs on
    # them, without a host to deploy to.
    packages.${system} = pkgs.callPackages ./nix/scripts.nix {};

    # The pre-commit hook checks a repository by running this, so a language
    # left out here is a language nothing checks.
    formatter = forEachSystem (pkgs:
      treefmt-nix.lib.mkWrapper pkgs {
        projectRootFile = "flake.nix";
        programs.alejandra.enable = true;
      });
  };
}
