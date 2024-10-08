{
  description = "Home Manager configuration of Lucas Santanna";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: rec {
    # Helper function to create Darwin configurations
    createDarwinConfig = { name, system, username }: darwin.lib.darwinSystem {
      pkgs = import nixpkgs { inherit system; };
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users."${username}".imports = [ ./modules/home-manager ];
          };
        }
      ];
    };

    darwinConfigurations = {
      # Configuration matching the expected system name
      "lucass-MacBook-Pro" = createDarwinConfig {
        name = "lucass-MacBook-Pro";  # Matching the expected system name
        system = "x86_64-darwin";      # Change to "aarch64-darwin" if needed
        username = "lucas";
      };

      # Example configuration for an ARM architecture, adjust as needed
      "lucass-ARM-MacBook" = createDarwinConfig {
        name = "lucass-ARM-MacBook";
        system = "aarch64-darwin";
        username = "lucas";
      };
    };
  };
}

