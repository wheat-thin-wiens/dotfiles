# dotfiles README

This repository contains the configuration files for the following programs:

- Alacritty
- neofetch
- neovim
- starship
- tmux
- zsh
- zsh-autocomplete0plugin
- zsh-autosuggestions
- zsh-syntax-highlighting

Ensure all of these are installed before using stow to create any symlinks.

Using this repository requires the following dependencies:

- git
- stow

## Using Stow

1. Use the `git clone` command to copy all of the files into the home directory.
2. When you're ready to apply the configuration for a specific program, use  
the `stow [program name]`command. This will create symlinks for the related  
config files in the appropriate directory.

## Changing Terminal Theme

The following programs are configured to use the same theme:

- Alacritty
- Neovim
- Startship

The configuration files for each of these programs will have to be modified  
in order to change the theme.

### Alacritty / Neofetch

1. Ensure theme files are present. If not, they can be downloaded from  
`https://github.com/alacritty/alacritty-theme` and placed into the  
`dotfiles/.config/Alacritty/themes` directory.
2. Open the `alacritty.toml` file located in the `dotfiles/.config` directory.  
This file references another directory containing the theme files for alacritty.
3. Simply change the name of the theme at the end of the directory within  
the `import` block.
4. Changes should take effect immediately upon saving the file.  
If not, simply quit and reopen alacritty.
5. Neofetch will automatically adopt the new colorscheme that was just set for alacritty.

### Neovim

1. Open the `themes.lua` file located in the `dotfiles/.config/nvim/lua`  
directory. All neovim themes are installed here.
2. All of the `config function()` functions are commented out  
except fot the currently active theme. Comment out the active theme's
config function and uncomment the theme you would like to use.
3. Save the file, and the new theme should be applied after quitting and
reopening neovim.

### Starship

1. Starship references the `starship.toml` file located in the
`dotfiles/.config` directory for its theme configuration.
2. There areother starship files in this directory configured for other
color schemes. They are named accordingly. Simply make a copy of one of
these files, name it `startship.toml`, and place it in the
`dotfiles/.config` directory.
