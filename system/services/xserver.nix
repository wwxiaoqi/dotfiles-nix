{
  # 启用 X11
  services.xserver = {
    enable = true;
    displayManager = { startx.enable = true; };
    # 配置 X11 键盘映射
    xkb.layout = "us";
  };
}
