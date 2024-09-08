#!/bin/zsh

function colorpick {
  cd ~/dotfiles/.config
  rm -f starship.toml
  cd -
  cd ~/dotfiles/.config/starship_themes
  cp starship_$1.toml ~/dotfiles/.config/starship.toml
  cd -

  nvim ~/dotfiles/.config/nvim/lua/theme-picker.lua

  nvim ~/dotfiles/.config/alacritty/alacritty.toml
}

