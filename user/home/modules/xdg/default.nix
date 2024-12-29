{ pkgs, ... }: 

{
  xdg.portal.wlr.enable = true;
  
  home.packages = [
    pkgs.xdg-desktop-portal
    pkgs.xdg-desktop-portal-wlr
    pkgs.xdg-desktop-portal-gtk
    pkgs.xdg-desktop-portal-hyprland
  ];

}