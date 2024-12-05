{ lib, pkgs, allowed-unfree-packages, allowed-insecure-packages, opt-config
, hostname, ... }:

{
  # 非自由软件包配置
  nixpkgs.config = {
    allowUnfreePredicate = allowed-unfree-packages;
    permittedInsecurePackages = allowed-insecure-packages;
  };

  # 导入其他配置文件
  imports = [
    ../hosts/${hostname}/hardware-configuration.nix
    ./user.nix
    ./packages.nix
  ];

  # 启用 systemd-boot 作为 EFI 引导加载器
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 设置网络主机名
  networking.hostName = "${hostname}";

  # 启用 NetworkManager 服务
  networking.networkmanager.enable = true;

  # 设置时区
  time.timeZone = "Asia/Shanghai";

  # 设置默认语言
  i18n.defaultLocale = "en_US.UTF-8";

  # 启用声音服务
  hardware.pulseaudio.enable = true;

  # 启用 Nix 的实验性特性，包括 Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # 设置默认编辑器为 vim
  environment.variables.EDITOR = "vim";

  # 启用 OpenSSH 守护进程
  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # 启用 dconf 服务
  programs.dconf.enable = true;

  # 启用 Zsh shell
  programs.zsh.enable = true;

  # 设置 Nix 替代服务器
  nix.settings.substituters =
    [ "https://mirror.sjtu.edu.cn/nix-channels/store" ];

  # 设置系统状态版本
  system.stateVersion = "24.11";

}