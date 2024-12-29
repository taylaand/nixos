{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "electron-25.9.0" ];
        };
      };
    in {
      nixosConfigurations.xps-9510 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            home-manager.users.ataylor = {
              imports = [ ./home.nix ];
            };
          }
        ];
      };

      homeConfigurations = {
        ataylor = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home.username = "ataylor";
              home.homeDirectory = "/home/ataylor";
              home.stateVersion = "24.11";
            }
            ./home.nix
          ];
        };
      };
    };
}

