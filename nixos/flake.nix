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
    # catppuccin.url = "github:catppuccin.nix";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
  in {

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [ ./configuration.nix ];
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
