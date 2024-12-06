{ pkgs, lib, opt-config, ... }: {
  programs.git = {
    enable = true;
    userName = "${opt-config.gitname}";
    userEmail = "${opt-config.gitmail}";
  };
}
