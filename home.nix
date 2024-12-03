{ config, pkgs, ... }:

{
  home.username = "xiaoqi";
  home.homeDirectory = "/home/xiaoqi";

  home.packages = with pkgs;[
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
  ];

  programs.git = {
    enable = true;
    userName = "wwxiaoqi";
    userEmail = "tahicoing@gmail.com";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
    '';
    shellAliases = {
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

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