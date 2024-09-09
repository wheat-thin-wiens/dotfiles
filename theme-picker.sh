#!/bin/zsh

function colorpick {
  cd ~/.config
  rm -f starship.toml
  cd -
  cd ~/.config/starship_themes
  cp starship_$1.toml ~/.config/starship.toml
  cd -

  nvim ~/.config/nvim/lua/theme-picker.lua

  nvim ~/.config/alacritty/alacritty.toml
}

