{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ git vim wget rsync ];

}
