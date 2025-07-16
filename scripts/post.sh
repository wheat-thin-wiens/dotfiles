#!/bin/bash

setup () {
  # Update pacman mirrors
  sudo reflector --protocol https --country "United States" --latest 5 --sort age --save /etc/pacman.d/mirrorlist 

  # Setup home directories
  mkdir ~/clones ~/projects

  # Clone nvim projects
  git clone https://github.com/wheat-thin-wiens/rei.nvim ~/projects

  # Install yay
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git ~/clones
  cd ~/clones/yay
  makepkg -si
  cd ~/
  
  # Install packages
  yay -S - < ~/dotfiles/packages.txt

  # Enable systemd services

}

setup()
