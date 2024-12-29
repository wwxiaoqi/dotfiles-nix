{ pkgs, unstable-pkgs, ... }: {
  opt-config = rec {
    # Basic
    username = "xiaoqi";

    # Git
    gitname = "wwxiaoqi";
    gitmail = "tahicoing@gmail.com";
    gitbranch = "main";

    # intel, nvidia, intel-nvidia, amd
    gpu-type = [ "intel" ];

    # Optimus PRIME
    intel-bus-id = "";
    nvidia-bus-id = "";

    # Use AutoCPU
    autocpu = false;

    # WM Options
    wm-options = { hyprland = true; };

    # Packages For this Machine
    packages = with pkgs; [ ];
  };
}
