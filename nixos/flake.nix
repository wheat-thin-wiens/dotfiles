{
  description = "My first flake";

  inputs = {
    # nixos.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs = {
      url =  "github:NixOS/nixpkgs/nixos-unstable";
    };

    # flake-registry.url = "github:NixOS/flake-registry";

    home-manager = {
      url =  "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # catppuccin.url = "github:catppuccin.nix";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    hyprland.url = "github:hyprwm/Hyprland";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, determinate, zen-browser, ... }@inputs:
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
        specialArgs = { inherit inputs;};
        modules = [ 
          ./configuration.nix
          determinate.nixosModules.default
          {
            nixpkgs.overlays = overlays;
          }
        ];
      };
    };
    
    homeConfigurations = {
      ewiens = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {
          inherit zen-browser;  
        };
        modules = [ ./home.nix ];
      };
    };

  };

}
