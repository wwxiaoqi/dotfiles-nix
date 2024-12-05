{ pkgs, lib, opt-config, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.plugins = [ "git" ];
    oh-my-zsh.theme = "robbyrussell";
    syntaxHighlighting.enable = true;
  };
}
