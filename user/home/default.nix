{ config, lib, pkgs, modify-pkgs, custom-pkgs, inputs, opt-config, ... }:
let
  my-packages = with pkgs;
    [
      neofetch
      zip
      xz
      unzip
      p7zip
      ripgrep
      jq
      eza
      fzf
      iperf3
      dnsutils
      ldns
      aria2
      socat
      nmap
      ipcalc
      file
      which
      tree
      gawk
      zstd
      nix-output-monitor
      btop
      iotop
      iftop
      strace
      ltrace
      lsof
      sysstat
      pciutils
      usbutils
      starship
    ] ++ opt-config.packages;
in {
  home.username = "${opt-config.username}";
  home.homeDirectory = "/home/${opt-config.username}";

  imports = [ ./modules ];

  home.packages = my-packages;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
