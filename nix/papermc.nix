# Paper's v2 API is sunset, and nixpkgs fetches from it and updates through it,
# so its papermc stopped at the last version that API served. This is the same
# jar off v3, which addresses a build by the checksum of the jar itself, on the
# JRE that build asks for.
{
  fetchurl,
  jdk25_headless,
  lib,
  makeBinaryWrapper,
  stdenvNoCC,
  udev,
}: let
  version = "26.2-118";
  sha256 = "1fdb86222a567800f4f4b61104ff565284f9f5c891190fec20a80d41eb985108";
in
  stdenvNoCC.mkDerivation {
    pname = "papermc";
    inherit version;

    src = fetchurl {
      url = "https://fill-data.papermc.io/v1/objects/${sha256}/paper-${version}.jar";
      inherit sha256;
    };

    dontUnpack = true;
    nativeBuildInputs = [makeBinaryWrapper];

    installPhase = ''
      runHook preInstall

      install -D $src $out/share/papermc/papermc.jar

      makeWrapper ${lib.getExe' jdk25_headless "java"} "$out/bin/minecraft-server" \
        --append-flags "-jar $out/share/papermc/papermc.jar nogui" \
        --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath [udev]}

      runHook postInstall
    '';

    meta = {
      description = "High-performance Minecraft server";
      homepage = "https://papermc.io/";
      license = lib.licenses.gpl3Only;
      sourceProvenance = [lib.sourceTypes.binaryBytecode];
      platforms = lib.platforms.linux;
      mainProgram = "minecraft-server";
    };
  }
