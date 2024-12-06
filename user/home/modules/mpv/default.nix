{ pkgs, ... }: {
  home.file.".config/mpv/input.conf".source = ./input.conf;
  home.file.".config/mpv/mpv.conf".source = ./mpv.conf;

  home.packages = [ pkgs.mpv ];
}
