{ nixpkgs, system, nixpkgs-unstable, nur }: rec {

  # 默认非自由软件包的超集
  allowed-unfree-packages = pkg:
    builtins.elem (nixpkgs.lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
      "spotify"
      "wpsoffice"
      "baidunetdisk"
      "dingtalk"
      "qq"
      "wechat-universal-bwrap"
      "wemeet-bin-bwrap"
      "amdgpu-pro"
      "wechat-uos"
      "widevine-cdm"
      "discord"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "wpsoffice-365"
    ];

  # 默认不安全软件包的超集
  allowed-insecure-packages = [ "electron-11.5.0" "openssl-1.1.1w" ];

  # 稳定分支软件包
  stable-pkgs = import nixpkgs {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
  };

  # 不稳定分支软件包
  unstable-pkgs = import nixpkgs-unstable {
    inherit system;
    config.allowUnfreePredicate = allowed-unfree-packages;
    config.permittedInsecurePackages = allowed-insecure-packages;
    overlays = [ nur.overlay ];
  };
}
