{ pkgs, ... }:

{
  home.file.".config/waybar/style.css".source = ./style.css;
  home.file.".config/waybar/config.jsonc".source = ./config.jsonc;
  home.file.".config/scripts/battery-info.sh".source = ./battery-info.sh;

  home.packages = [ pkgs.waybar ];

  programs.waybar.enable = true;
}
