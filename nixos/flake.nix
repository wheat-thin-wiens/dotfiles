{
  description = "My first flake";

  inputs = {
    nixpkgs = {
      url =  "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url =  "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    # catppuccin.url = "github:catppuccin.nix";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, determinate, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
  in 
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
          ./configuration.nix
          determinate.nixosModules.default
          {
            nixpkgs.overlays = overlays;
          }
        ];
      };
      # nixos = nixpkgs.lib.nixosSystem {
      #   specialArgs = { inherit inputs; };
      #   modules = [
      #     ./configuration.nix
      #   ];
      # };
    };
    
    homeConfigurations = {
      ewiens = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };

  };

}
