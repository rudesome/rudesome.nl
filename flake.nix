{
  description = "rudesome.nl website content";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs }:
    let
      name = "rudesome.nl";
      system = "x86_64-linux";
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in
    {

      devShells.${system}.default =
        with pkgs;
        mkShell
          {
            buildInputs = with pkgs; [
              gnumake
              texliveFull
              hugo
            ];
          };

    };
}
