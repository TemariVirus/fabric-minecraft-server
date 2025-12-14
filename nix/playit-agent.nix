{ lib, fetchFromGitHub, rustPlatform }:

let
  src = fetchFromGitHub {
    owner = "playit-cloud";
    repo = "playit-agent";
    rev = "v0.16.5";
    hash = "sha256-0N1NpFl8ekqEtsfdr6Zv8a2xmwrl5e6Zn8ar8ajJZmo=";
  };
  cargoLock = "${src}/Cargo.lock";
  cargoToml = lib.importTOML "${src}/Cargo.toml";
in rustPlatform.buildRustPackage {
  pname = "playit-agent";
  inherit src;

  inherit (cargoToml.workspace.package) version;
  cargoLock = { lockFile = cargoLock; };

  strictDeps = true;
  # Requires internet access
  doCheck = false;
}
