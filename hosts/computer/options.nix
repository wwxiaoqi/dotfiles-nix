{ pkgs, unstable-pkgs, ... }: {
  opt-config = rec {
    # Basic
    username = "xiaoqi";

    # Git
    gitname = "wwxiaoqi";
    gitmail = "tahicoing@gmail.com";
    gitbranch = "main";

    # intel, nvidia, intel-nvidia, amd
    gpu-type = [ ];

    # Optimus PRIME
    # intel-bus-id = "PCI:0:2:0";
    # nvidia-bus-id = "PCI:3:0:0";

    # Use AutoCPU
    autocpu = false;

    # Packages For this Machine
    packages = with pkgs; [ ];
  };
}
