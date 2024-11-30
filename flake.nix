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
     # overlays.default = final: prev: {
     #   simple_python_package = prev.python3Packages.callPackage ./pkgs/simple_python_package{ };
     # };
      
      overlays.default = [
        (final: prev: {
          python3 = prev.python3.override {
            overrides = self: super: {
              simple_python_package = super.python3Packages.callPackage ./pkgs/simple_python_package{ };
            };
          };
        })
      ];
      packages.${system} = {
        simple_python_package = pkgs.python3Packages.callPackage ./pkgs/simple_python_package { };
      };
    };
}
