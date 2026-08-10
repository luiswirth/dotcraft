{
  callPackage,
  writeShellApplication,
  coreutils,
  git,
  jq,
  systemd,
  util-linux,
}: let
  # On the bridge's path so that it is on the model's, which inherits it.
  mcfn = callPackage ./mcfn.nix {};
in
  writeShellApplication {
    name = "dotcraft-bridge";
    runtimeInputs = [coreutils git jq systemd util-linux mcfn];
    # A daemon handles its own failures. Under errexit the first one that is not
    # handled, a chat line arriving while the server restarts, ends the loop.
    bashOptions = ["nounset" "pipefail"];
    text = builtins.readFile ./bridge.sh;
  }
