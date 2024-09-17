{
  description = "my flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs: {
    darwinConfigurations.airbud-2-pawppin-off = inputs.darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
    };
    modules = [
      ({ pkgs, ... }: {
        # Darwin preferences and config items
        programs.zsh.enable = true;
        environment.shells = [ pkgs.bash pkgs.zsh ];
        environment.loginShell = plgs.zsh;
        nix.extraOptions = ''
          experimental-features = nix-command flakes
        '';
        systemPackages = [ pkgs.coreutils ];
        system.keyboard.enableKeyMapping = true;
        system.keyboard.remapCapsLockToControl = true;
        fonts.fontDir.enable = false;
        fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Meslo" ]; }) ]; 
        services.nix-daemon.enable = true;
        system.defaults.finder.AppleShowAllExtensions = true;
        system.defaults.finder._FXShowPosixPathInTitle = true;
        system.defaults.dock.autohide = true;
        system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
        system.defaults.NSGlobalDomain.InitialKeyRepeat = 14;
        system.defaults.NSGlobalDomain.KeyRepeat = 1;
      })
      (inputs.home-manager.darwinModules.home-manager {
        home-manager = {
          useGlobalPkgs = true;
          useUserPkgs = true;
          users.ethanwiens.imports = [
            ({ pkgs, ... }: {
              home.packages = [
                pkgs.fzf               
                pkgs.ripgrep
              ];
            })
          ];
        };
      })
    ];
  };
}
