{
  description = "Set up minecraft server with playit.gg tunnel";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = { self, ... }@inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import inputs.nixpkgs { inherit system; };
        fabric-server = pkgs.callPackage nix/fabric-server.nix {
          minecraftVersion = "1.21.5";
          loaderVersion = "0.18.2";
          installerVersion = "1.1.0";
          jarHash = "sha256-qj9GxjkoFa2nqiyy/mWoCzVPCtAfulPtIhL00W9rs00=";
        };
        playit-agent = pkgs.callPackage nix/playit-agent.nix { };
      in {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.coreutils pkgs.openjdk21 playit-agent ];

          shellHook = ''
            export SERVER_JAR=${fabric-server}
          '';
        };
      });
}
