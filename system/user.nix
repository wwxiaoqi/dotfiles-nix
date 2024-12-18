{ pkgs, opt-config, ... }:
let name = opt-config.username;
in {
  users.users.${name} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "libvirtd" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
