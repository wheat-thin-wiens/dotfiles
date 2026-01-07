{ config, pkgs, zen-browser, ... }:

let

  startTmux = pkgs.writeShellApplication {
    name = "start_tmux";
    runtimeInputs = [ pkgs.tmux ];
    text = ''
      # if [ -z "''${PS1:-}" ]; then
      #   exit 0
      # fi

      case "''${TERM:-}" in
        screen*|tmux*) exit 0 ;;
      esac

      if [ -z "''${TMUX:-}" ]; then
        exec tmux
      fi
    '';
  };

  zen-pkg = zen-browser.packages."${pkgs.system}".default;

in
{
  home.username = "ewiens";
  home.homeDirectory = "/home/ewiens";
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
    pkgs.amberol
    pkgs.bat
    pkgs.btop
    pkgs.cargo
    pkgs.cava
    pkgs.cbonsai
    pkgs.eslint
    pkgs.eza
    pkgs.feh
    pkgs.fira-code-symbols
    pkgs.font-awesome
    pkgs.fzf
    pkgs.gh
    pkgs.ghostty
    pkgs.gopls
    pkgs.gradle
    # pkgs.git
    pkgs.hyprpaper
    pkgs.hyprshot
    pkgs.jdt-language-server
    pkgs.jetbrains-mono
    pkgs.kdePackages.ark
    pkgs.kdePackages.okular
    pkgs.keyd
    pkgs.lazygit
    pkgs.love
    pkgs.lua
    pkgs.lua-language-server
    pkgs.luarocks
    pkgs.maven
    pkgs.mullvad-vpn
    pkgs.nemo
    pkgs.neofetch
    pkgs.nil
    pkgs.obsidian
    pkgs.polybar
    pkgs.pyright
    pkgs.ripgrep
    pkgs.rofi
    pkgs.starship
    pkgs.swww
    pkgs.tagger
    pkgs.tailwindcss-language-server
    pkgs.thunar
    pkgs.tmux
    pkgs.typescript-language-server
    pkgs.unzip
    pkgs.waybar
    pkgs.wezterm
    pkgs.yazi
    pkgs.zsh-autocomplete
    pkgs.zsh-autosuggestions
    pkgs.zsh-completions
    pkgs.zsh-prezto
    pkgs.zsh-syntax-highlighting

    zen-browser.packages."${pkgs.system}".default
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty".source = ../alacritty/.config/alacritty;
    ".config/bat".source       = ../bat/.config/bat;
    ".config/btop".source      = ../btop/.config/btop;
    ".config/ghostty".source   = ../ghostty/.config/ghostty;
    ".config/hypr".source      = ../hypr/.config/hypr;
    ".config/i3".source        = ../i3/.config/i3;
    ".config/neofetch".source  = ../neofetch/.config/neofetch;
    ".config/nvim".source      = ../nvim/.config/nvim;
    ".config/picom".source     = ../picom/.config/picom;
    ".config/polybar".source   = ../polybar/.config/polybar;
    ".config/rofi".source      = ../rofi/.config/rofi;
    ".config/starship.toml".source  = ../starship/.config/starship.toml;
    ".config/thefuck".source   = ../thefuck/.config/thefuck;
    # ".tmux".source             = ../tmux/.tmux;
    # ".tmux.conf".source        = ../tmux/.tmux.conf;
    ".config/waybar".source    = ../waybar/.config/waybar;
    ".config/wezterm".source   = ../wezterm/.config/wezterm;
    ".config/yazi".source      = ../yazi/.config/yazi;

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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-beta.desktop";
      "x-scheme-handle/http" = "zen-beta.desktop";
      "x-scheme-handle/https" = "zen-beta.desktop";
      "x-scheme-handle/about" = "zen-beta.desktop";
      "x-scheme-handle/unknown" = "zen-beta.desktop";
    };
  };

  home.sessionVariables = {
    BROWSER = "zen";
    DEFAULT_BROWSER = "${zen-browser.packages."${pkgs.system}".default}/bin/zen";
    EDITOR = "nvim";
  };

  fonts.fontconfig.enable = true;

  # wayland.windowManager.hyprland = {
  #   enable = true;
  # };

  # programs.git = {
  #   enable = true;
  #   userName = "wheat-thin-wiens";
  #   userEmail = "ethanjwiens@gmail.com";
  # };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    prefix = "C-a";
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      unbind [
      unbind ]

      bind [ split-window -h
      bind ] split-window -v

      set -g default-terminal "tmux-256color"
      set -ga terminal-overrides ",xterm-256color:rgb"
      set -ga terminal-overrides ",alacritty:RGB"

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status off
      set-option -g escape-time 10
    '';
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      size = 10000;
    };
    shellAliases = {
      ls = "eza -a";
    };
    prezto = {
      enable = true;
      tmux.autoStartLocal = true;
    };
    initContent = ''
      if [[ -o interactive ]]; then
        if [[ -z "$TMUX" && "$TERM" != screen* && "$TERM" != tmux* ]]; then
          exec ${pkgs.tmux}/bin/tmux
        fi
      fi

      neofetch
    '';
  };

  # services.keyd = {
  #   enable = true;
    # nodes = {
    #   # change default to actual device from output of `keyd -l`
    #   default = {
    #     ids = [ "*" ];
    #     settings = {
    #       main = {
    #         capslock = "overload(control, esc)";
    #       };
    #     };
    #   };
    # };
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
