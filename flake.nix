{
  description = "reveal presentation";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      py = pkgs.python311Packages;
    in {
      devShells.default = pkgs.mkShell rec {
        packages = with pkgs; [
          py.livereload
        ];
      };
    });
}