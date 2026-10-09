{
  description = "rudesome.nl website and résumé";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs = { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          packages = [
            pkgs.gnumake
            pkgs.hugo
            # Minimal TeX Live with only what awesome-cv.cls needs
            # (instead of the multi-GB texliveFull).
            (pkgs.texliveSmall.withPackages (ps: with ps; [
              enumitem
              environ
              fontawesome
              ifmtarg
              needspace
              pdfcol
              ragged2e
              setspace
              sourcesanspro
              tcolorbox
              tikzfill
              unicode-math
              xifthen
            ]))
          ];
        };
      });
    };
}
