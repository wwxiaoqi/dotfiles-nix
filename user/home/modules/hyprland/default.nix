{ pkgs, ... }:

{
  home.file.".config/hypr/conf/monitor.conf".source = ./conf/monitor.conf;
  home.file.".config/hypr/conf/autostart.conf".source = ./conf/autostart.conf;
  home.file.".config/hypr/conf/environments.conf".source =
    ./conf/environments.conf;
  home.file.".config/hypr/conf/general.conf".source = ./conf/general.conf;
  home.file.".config/hypr/conf/decoration.conf".source = ./conf/decoration.conf;
  home.file.".config/hypr/conf/animations.conf".source = ./conf/animations.conf;
  home.file.".config/hypr/conf/layouts.conf".source = ./conf/layouts.conf;
  home.file.".config/hypr/conf/input.conf".source = ./conf/input.conf;
  home.file.".config/hypr/conf/gestures.conf".source = ./conf/gestures.conf;
  home.file.".config/hypr/conf/misc.conf".source = ./conf/misc.conf;
  home.file.".config/hypr/conf/binds.conf".source = ./conf/binds.conf;
  home.file.".config/hypr/conf/windowrules.conf".source =
    ./conf/windowrules.conf;

  # hyprland 配置
  wayland.windowManager.hyprland = {

    # 是否启用 Hyprland
    enable = true;

    # 使用的 hyprland 软件包
    package = pkgs.hyprland;

    # 是否启用 XWayland
    xwayland.enable = true;

    # 添加到 ~/.config/hypr/hyprland.conf 的额外配置
    extraConfig = ''
      source = ~/.config/hypr/conf/monitor.conf
      source = ~/.config/hypr/conf/autostart.conf
      source = ~/.config/hypr/conf/environments.conf
      source = ~/.config/hypr/conf/general.conf
      source = ~/.config/hypr/conf/decoration.conf
      source = ~/.config/hypr/conf/animations.conf
      source = ~/.config/hypr/conf/layouts.conf
      source = ~/.config/hypr/conf/input.conf
      source = ~/.config/hypr/conf/gestures.conf
      source = ~/.config/hypr/conf/misc.conf
      source = ~/.config/hypr/conf/binds.conf
      source = ~/.config/hypr/conf/windowrules.conf
    '';
  };

}
