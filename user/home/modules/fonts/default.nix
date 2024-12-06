{ pkgs, custom-pkgs, ... }: {
  home.file.".config/fontconfig/fonts.conf".source = ./fonts.conf;

  home.packages = with pkgs; [
    noto-fonts
    inter-nerdfont
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    sarasa-gothic
  ];
}
