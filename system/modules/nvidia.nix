{ config, lib, opt-config, ... }: {

  # 禁用 nouveau
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';

  # 加载 Xorg 、Wayland 的 nvidia 驱动程序
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {

    # 需要进行 mode 设置
    modesetting.enable = true;

    # 英伟达电源管理 experimental
    powerManagement.enable = false;

    # 更加细致的电源管理 experimental
    powerManagement.finegrained = false;

    # 使用 NVidia 开源内核模块
    # 支持的 GPU 的完整列表位于：
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    open = false;

    # 启用 Nvidia 设置菜单
    nvidiaSettings = true;

    # 指定驱动程序版本
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # 配置 Optimus PRIME
    prime = lib.mkIf (builtins.elem "intel-nvidia" opt-config.gpu-type) {

      # 启用卸载模式
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # PRIME 同步
      sync.enable = false;

      # 反向同步
      allowExternalGpu = false;

      intelBusId = "${opt-config.intel-bus-id}";
      nvidiaBusId = "${opt-config.nvidia-bus-id}";
    };
  };
}
