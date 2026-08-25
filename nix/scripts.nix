{
  writeShellApplication,
  coreutils,
  gnugrep,
  gnused,
  jq,
  systemd,
}: rec {
  mcfn = writeShellApplication {
    name = "mcfn";
    runtimeInputs = [coreutils systemd];
    text = builtins.readFile ../bin/mcfn.sh;
  };

  # mcfn is on its path so that it is on the model's, which inherits it.
  dotcraft-claude = writeShellApplication {
    name = "dotcraft-claude";
    runtimeInputs = [coreutils gnugrep gnused jq systemd mcfn];
    # A daemon handles its own failures. Under errexit the first one that is not
    # handled, a chat line arriving while the server restarts, ends the loop.
    bashOptions = ["nounset" "pipefail"];
    text = builtins.readFile ../bin/claude.sh;
  };
}
