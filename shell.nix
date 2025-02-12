
{ pkgs ? import <nixpkgs> {} }:

let
  tex = pkgs.texlive.combine {
    inherit (pkgs.texlive) scheme-full;
  };
in
pkgs.mkShell {
  buildInputs = [
    tex
    pkgs.texlive.bin.xetex  # Explicitly include XeTeX
    pkgs.noto-fonts
    pkgs.noto-fonts-cjk-sans
    pkgs.noto-fonts-emoji
    pkgs.lato
  ];

  # Ensure the fonts are in the fontconfig path
  FONTCONFIG_PATH = "${pkgs.fontconfig.out}/etc/fonts";

  shellHook = ''
    echo "Custom LaTeX environment with XeTeX and all packages is ready"
  '';
}
