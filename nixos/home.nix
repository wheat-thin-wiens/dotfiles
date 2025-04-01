{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ewiens";
  home.homeDirectory = "/home/ewiens";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.eza
    pkgs.jetbrains-mono
    pkgs.lua
    pkgs.luarocks
    pkgs.nemo
    pkgs.neovim
    # pkgs.obsidian
    pkgs.picom
    # pkgs.posy-cursors
    pkgs.starship
    pkgs.swww
    pkgs.tmux

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ewiens/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
    };
    shellAliases = {
      ls = "eza";
    };
    initExtra = ''
      neofetch
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  gtk = {
    enable = true;
  };

  home.file.".config/alacritty".source = ../alacritty/.config/alacritty;
  home.file.".config/bat".source       = ../bat/.config/bat;
  home.file.".config/btop".source      = ../btop/.config/btop;
  home.file.".config/ghostty".source   = ../ghostty/.config/ghostty;
  home.file.".config/hypr".source      = ../hypr/.config/hypr;
  home.file.".config/i3".source        = ../i3/.config/i3;
  home.file.".config/neofetch".source  = ../neofetch/.config/neofetch;
  home.file.".config/nvim".source      = ../nvim/.config/nvim;
  home.file.".config/picom".source     = ../picom/.config/picom;
  home.file.".config/polybar".source   = ../polybar/.config/polybar;
  home.file.".config/rofi".source      = ../rofi/.config/rofi;
  home.file.".config/starship.toml".source  = ../starship/.config/starship.toml;
  home.file.".config/thefuck".source   = ../thefuck/.config/thefuck;
  home.file.".tmux".source             = ../tmux/.tmux;
  home.file.".tmux.conf".source        = ../tmux/.tmux.conf;
  home.file.".config/waybar".source    = ../waybar/.config/waybar;
  home.file.".config/wezterm".source   = ../wezterm/.config/wezterm;
  home.file.".config/yazi".source      = ../yazi/.config/yazi;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
