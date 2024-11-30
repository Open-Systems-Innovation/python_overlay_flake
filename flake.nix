{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = 
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      overlay.default = final: prev: {
        hi-there-world = prev.callPackage ./pkgs/hi-there-world { };
      };
      
      packages.${system} = {
        simple_python_package = pkgs.python3Packages.callPackage ./pkgs/simple_python_package { };
      };
    };
}