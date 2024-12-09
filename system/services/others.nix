{ opt-config, ... }: {
  # 启用触摸板
  services.libinput.enable = true;

  # 启用 OpenSSH 守护进程
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # 启用 D-Bus 进程间通信
  services.dbus.enable = true;

  # 启用 Rtkit 实时处理
  security.rtkit.enable = true;

  # 启用 Polkit
  security.polkit.enable = true;

  # Usbmuxd 用于在 USB 协议上实现多路 TCP 连接
  services.usbmuxd.enable = true;

  # Auto cpu freq 自动优化 CPU 频率和电源管理
  services.auto-cpufreq.enable = opt-config.autocpu;

}
