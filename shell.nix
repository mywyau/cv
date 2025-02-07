{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    (texlive.combine {
      inherit (texlive) scheme-full xetex latexmk fontawesome5;
    })
    fontconfig  # Ensures fonts work properly
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  shellHook = ''
    echo "Awesome CV LaTeX environment is ready."
  '';
}
