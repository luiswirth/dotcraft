{
  writeShellApplication,
  coreutils,
  systemd,
}:
writeShellApplication {
  name = "mcfn";
  runtimeInputs = [coreutils systemd];
  text = builtins.readFile ./mcfn.sh;
}
