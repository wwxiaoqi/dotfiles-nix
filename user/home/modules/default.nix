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
  ] ++ lib.optionals (opt-config.wm-options.hyprland) [
    ./hyprland
    ./foot
    ./rofi
  ];
}
