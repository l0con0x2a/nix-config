{
  description = "larao dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      hostname = "nixos";

      hosts = {
        nixos = {
          system = "x86_64-linux";
          user = {
            name = "larao";
            homeDirectory = "/home/larao";
          };
          nixosModules = [
            ./hosts/nixos/configuration.nix
          ];
          homeModules = [
            ./hosts/nixos/home.nix
          ];
        };
      };

      host = hosts.${hostname} or (throw "Unknown host: ${hostname}");

      commonHomeModules = [
        ./home.nix
      ];

      homeConfiguration = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit (host) system;
          config.allowUnfree = true;
        };

        extraSpecialArgs = {
          inherit host hostname;
        };

        modules = commonHomeModules ++ host.homeModules;
      };
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit (host) system;
        modules = host.nixosModules;
      };

      homeConfigurations = {
        ${host.user.name} = homeConfiguration;
        "${host.user.name}@${hostname}" = homeConfiguration;
      };
    };
}
