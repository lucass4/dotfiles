{
  description = "Home Manager configuration of Lucas Santanna";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.url = "github:NixOS/nixpkgs/master";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helix-themes = {
      url = "github:eureka-cpu/helix-themes.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zjstatus = {
      url = "github:dj95/zjstatus";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, zjstatus, ... }: rec {
    # Helper function to create Darwin configurations
    createDarwinConfig = { name, system, username }: darwin.lib.darwinSystem {
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          (final: prev: {
            zjstatus = zjstatus.packages.${prev.system}.default;
          })
        ];
      };
      specialArgs = { inherit inputs; }; # Pass inputs to modules
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users."${username}".imports = [ ./modules/home-manager ];
            extraSpecialArgs = { inherit inputs; }; # Pass inputs to home-manager modules
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
      "fg-lstanaanna" = createDarwinConfig {
        name = "fg-lstanaanna";
        system = "aarch64-darwin";
        username = "lucas";
      };
    };
  };
}

