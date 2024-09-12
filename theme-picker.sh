#!/bin/zsh

function colorpick {
  cd ~/dotfiles/starship/.config
  rm -f starship.toml
  cd -
  cd ~/dotfiles/starship/.config/starship_themes
  cp starship_$1.toml ~/.config/starship.toml
  cd -
  cd ~/dotfiles
  stow starship
  cd -

  nvim ~/.config/nvim/lua/theme-picker.lua

  nvim ~/.wezterm.lua
}

