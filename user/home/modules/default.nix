{ opt-config, lib, ... }: {
  imports = [
    ./bash
    ./zsh
    ./fish
    ./fonts
    ./fcitx5
    ./theme
    ./mimetype
    ./fzf
    ./fonts
    ./mpv
    ./xdg
  ] ++ lib.optionals (opt-config.wm-options.hyprland) [
    ./hyprland
    ./alacritty
    ./foot
    ./rofi
    ./waybar
  ];
}
