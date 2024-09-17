{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager }: # {
    #     darwinConfigurations = {
    #       hostname = darwin.lib.darwinSystem {
    #         system = "aarch64-darwin";
    #         modules = [
    #           ./configuration.nix
    #           home-manager.darwinModules.home-manager
    #           {
    #             home-manager.useGlobalPkgs = true;
    #             home-manager.useUserPackages = true;
    #             home-manager.users.jdoe = import ./home.nix;
    # 
    #             # Optionally, use home-manager.extraSpecialArgs to pass
    #             # arguments to home.nix
    #           }
    #         ];
    #       };
    #     };
    #   };
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = [
          # pkgs.alacritty
          # pkgs.btop
          # pkgs.iterm2
          # pkgs.lazygit
          # pkgs.mc
          # pkgs.meslo-lgs-nf
          # pkgs.neovim
          # pkgs.starship
          # pkgs.tmux
          # pkgs.vim
          # pkgs.yazi
        ];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh = {
          enable = true;
          # enableCompletion = true;
          # autosuggestion.enable = true;
          # syntaxHighlighting.enable = true;
        };
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.ethanwiens = {
          name = "ethanwiens";
          home = "/Users/ethanwiens";
        };

      security.pam.enableSudoTouchIdAuth = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."airbud-2-pawppin-off" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."simple".pkgs;
  };
}
