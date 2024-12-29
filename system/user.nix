{ pkgs, opt-config, ... }:
let name = opt-config.username;
in {
  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "users" ];
    packages = with pkgs; [ ];
  };
}
