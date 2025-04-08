{

  description = "My first flake";

  inputs = {
    nixpkgs = {
      url =  "nixpkgs/nixos-unstable";
    };

    home-manager = {
      url =  "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    # catppuccin.url = "github:catppuccin.nix";
  };

  outputs = { self, nixpkgs, home-manager, determinate, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ 
            ./configuration.nix
            determinate.nixosModules.default
        ];
      };
    };
    
    homeConfigurations = {
      ewiens = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home.nix ];
      };
    };

  };

}
