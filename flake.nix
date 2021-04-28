{
  description = "dev flake";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      flake-utils.url = "github:numtide/flake-utils";
    };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        crossPkgs = import nixpkgs {
          system = "x86_64-linux";
          crossSystem = "aarch64-linux";
        };
      in
      {
        devShell = crossPkgs.mkShell { };
      });
}
