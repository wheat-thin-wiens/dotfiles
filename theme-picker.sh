#!/bin/zsh

function colorpick {
  if [ $1 = 'list' ]; then
    bat ~/dotfiles/themes.md

  else
    cd ~/dotfiles/starship/.config
    rm -f starship.toml
    cd -
    cd ~/dotfiles/starship/.config/starship_themes
    cp starship_$1.toml ~/dotfiles/starship/.config/starship.toml
    cd -
    cd ~/dotfiles
    stow starship
    cd -
    echo "Starship theme updated."

    nvim ~/.config/nvim/lua/theme-picker.lua
    echo "Neovim theme updated."

    nvim ~/.wezterm.lua
    echo "WezTerm theme updated."

    echo "Transparency options for neovim may need to be changed in themes.lua"
  fi
}

