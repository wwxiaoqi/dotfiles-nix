{ config, lib, pkgs, modify-pkgs, custom-pkgs, inputs, opt-config, ... }:
let
  my-packages = with pkgs;
    [
      zip
      xz
      unzip
      p7zip
      git
      jq
      eza
      fzf
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
      btop
      iotop
      iftop
      strace
      ltrace
      lsof
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
