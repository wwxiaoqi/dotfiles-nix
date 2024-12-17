{ nixpkgs, system, nixpkgs-unstable, nur }: rec {

  # 默认非自由软件包的超集
  allowed-unfree-packages = pkg:
    builtins.elem (nixpkgs.lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-persistenced"
    ];

  # 默认不安全软件包的超集
  allowed-insecure-packages = [

  ];

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
    overlays = [ nur.overlays.default ];
  };
}
