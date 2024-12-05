{
  description = "NixOS flake configuration";

  inputs = {
    # Nixpkgs: 主 Nix 包集合
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    # Nixpkgs: 不稳定分支
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Home manager: 用于管理用户环境的工具
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    # NUR: Nix 社区的包集合
    nur.url = "github:nix-community/NUR";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nur, ... }@inputs:
    let
      # 系统架构定义
      system = "x86_64-linux";

      # 导入包设置
      pkg-settings = import ./nix/pkgs-settings.nix {
        inherit nixpkgs;
        inherit system;
        inherit nixpkgs-unstable;
        inherit nur;
      };

      # 导入主机配置
      hosts-conf = import ./nix/hosts-conf.nix { inherit pkg-settings; };

      # 系统生成函数
      system-gen = { host-conf }:
        with pkg-settings;
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit allowed-unfree-packages;
            inherit allowed-insecure-packages;
            opt-config = host-conf.config;
            hostname = host-conf.name;
          };

          # 模块列表
          modules = [
            # 使用 NUR overlay
            {
              nixpkgs.overlays = [ nur.overlay ];
            }

            # 添加不稳定包 overlay
            ({
              nixpkgs.overlays =
                [ (final: prev: { unstable = unstable-pkgs; }) ];
            })

            # 导入系统配置
            ./system/configuration.nix

            # 导入用户服务配置
            ./user/services/default.nix

            # 导入 Home Manager 模块
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${host-conf.config.username} =
                import ./user/home;
              home-manager.extraSpecialArgs = {
                inherit inputs;
                opt-config = host-conf.config;
              };
            }
          ];
        };
    in {
      # 定义 NixOS 配置
      nixosConfigurations = with hosts-conf; {
        "${Computer.name}" = system-gen { host-conf = Computer; };
      };
    };

}
