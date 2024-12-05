{ pkgs, lib, opt-config, ... }: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
  };
}
