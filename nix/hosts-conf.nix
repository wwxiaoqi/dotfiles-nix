{ pkg-settings }: {
  Computer = with pkg-settings; rec {
    name = "computer";
    config = (import ../hosts/${name}/options.nix {
      pkgs = stable-pkgs;
      unstable-pkgs = unstable-pkgs;
    }).opt-config;
  };
}
