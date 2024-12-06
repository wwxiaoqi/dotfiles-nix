{ pkgs, custom-pkgs, ... }: {
  home.file.".config/fish/config.fish".source = ./config.fish;
  home.file.".config/fish/fish_variables".source = ./fish_variables;
  home.file.".config/fish/functions/bunnyfetch.fish".source =
    ./functions/bunnyfetch.fish;
  home.file.".config/fish/functions/cat.fish".source = ./functions/cat.fish;
  home.file.".config/fish/functions/clear.fish".source = ./functions/clear.fish;
  home.file.".config/fish/functions/fish_prompt.fish".source =
    ./functions/fish_prompt.fish;
  home.file.".config/fish/functions/fish_right_prompt.fish".source =
    ./functions/fish_right_prompt.fish;
  home.file.".config/fish/functions/git_is_repo.fish".source =
    ./functions/git_is_repo.fish;

  home.packages = [ pkgs.fish ];
}
