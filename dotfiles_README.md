# macOS dotfiles README

This repository contains the configuration files for the following programs:

- Alacritty
- midnight-commander
- neofetch
- neovim
- starship
- tmux
- zsh
- zsh-autocomplete-plugin
- zsh-autosuggestions
- zsh-syntax-highlighting

Ensure all of these are installed before using stow to create any symlinks.

Using this repository requires the following dependencies:

- git
- Homebrew
- stow

## Using Homebrew

Homebrew is the macOS package manager responsible for managing all of programs whose configurations live in this repository.
Ensure Homebrew is installed before attempting to use this repository. Follow the in instructions on the 
[Homebrew website](https://brew.sh/) to get Homebrew installed. Python is also installed via Homebrew, which requires that a virtual
environment be set up to manage additional Python libraries. Check the README file in the Python repository for more details.

The following additional programs have been installed using Homebrew:

- alacritty
- bash
- bat
- chruby
- dotnet
- dotnet-sdk
- fd
- firefox
- font-meslo-lg-nerd-font
- lua
- mc
- mono
- mysql
- mysql workbench
- neofetch
- neovim
- node
- Python
- qt
- raycast
- ripgrep
- ruby
- sketchybar
- skhd
- thefuck
- tmux
- wget
- yabai

## Using Stow

- Use the `git clone` command to copy all of the files into the home directory.
- When you're ready to apply the configuration for a specific program, use  
the `stow [program name]`command. This will create symlinks for the related  
config files in the appropriate directory.
- If you have made changes to any configurations within the `dotfiles`
directory, you can commit them to github with the following commands:

    1. `cd ~/dotfiles`
    2. `git add .`
    3. `git commit -m "your message here"`
    4. `git push -u -f origin main`

## Changing Terminal Theme

The following programs are configured to use the same theme:

- Alacritty
- midnight commander
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

### midnight commander

1. Place theme files in `~/.local/share/mc/skins`
2. Change theme in mc config in the `~/dotfiles/.config/mc/ini` file. Simply change the name of the theme on line 86.

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

## Python Libraries

- BeautifulSoup4
- bext (not available from arch repository)
- django
- mysql.connector (`sudo pacman -S python-mysql-connector`)
- numpy
- pandas
- pygame
- pyinstaller (not available from arch repository)
- pyqt5
- spotipy (not available from arch repository)

To install in arch linux, ensure python and pip are installed via pacman
using the following commands:
`sudo pacman -S python`
`sudo pacman -S python-pip`

To install packages on arch, the following command must be used:
`sudo pacman -S python-[package name]`

## NeoVim Configuration

For my configuration, I followed TypeCraft's build guide series on YouTube.
TypeCraft included the following plugins in [his build guide](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&ab_channel=typecraft):

- [alpha](https://github.com/goolord/alpha-nvim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [lualine](https://github.com/nvim-lualine/lualine.nvim)
- [luasnip](https://github.com/L3MON4D3/LuaSnip)
- [mason](https://github.com/williamboman/mason.nvim)
- [mason-lsp-config](https://github.com/williamboman/mason-lspconfig.nvim)
- [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [none-ls](https://github.com/nvimtools/none-ls.nvim)
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lsp-config](https://github.com/neovim/nvim-lspconfig)
- [nvim-tmux navigator](https://github.com/christoomey/vim-tmux-navigator)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#themes)
- [telescope-ui-select](https://github.com/nvim-telescope/telescope-ui-select.nvim)
- [treesitter](https://github.com/nvim-treesitter/nvim-treesittera)

I have added the following plugins:

- [autopairs](https://github.com/windwp/nvim-autopairs)
- [auto-save](https://github.com/pocco81/auto-save.nvim)
- [fine-cmdline](https://github.com/VonHeikemen/fine-cmdline.nvim)
- [searchbox](https://github.com/VonHeikemen/searchbox.nvim)
- [telescope-undo](https://github.com/debugloop/telescope-undo.nvim)
- [which-key](https://github.com/folke/which-key.nvim)

as well as these themes:

- [nightfox](https://github.com/EdenEast/nightfox.nvim)
- [cyberdream](https://github.com/scottmckendry/cyberdream.nvim)
- [blue-moon](https://github.com/kyazdani42/blue-moon)
- [rasmus](https://github.com/kvrohit/rasmus.nvim)

All of these packages are managed by Lazy and are stored in the
``/lua/plugins``
directory, making them modular and super easy to manage and configure.

I have also configured most of my keymaps in
``/lua/vim.options.lua``
which I have set to be loaded on startup in my init.lua file.

## Configuring tmux

1. In order to get tmux working properly, tpm must first be cloned from the
[tpm github](https://github.com/tmux-plugins/tpm).
2. Add the appropriate lines of code as laid out in the tpm documentation.
3. Run the `tmux source ~/.tmux.conf` command.
4. Once tmux has reloaded, press `<leader> + I` to install tmux plugins.
All other plugins may have to be cloned as well. All of my other plugins
are listed below:

    - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

## Installing Ruby

Installing Ruby is a huge pain in the ass. macos comes with a version of Ruby pre-installed,
but it's very old and doesn't give you permission to install gem packages. 
What you'll want to do is install chruby to manage your installed versions of Ruby.
This will allow you to change the default Ruby package macos uses as well as fall back on
whatever version of Ruby is needed for a given project. 
Follow [this guide](https://mac.install.guide/ruby/12) and 
[this guide](https://mac.install.guide/ruby/12) to get there. It mostly consists of installing
a few packages via Homebrew, then adding a few lines to the `.zshrc` file, whcih are already 
present in the version stored in this repository.
