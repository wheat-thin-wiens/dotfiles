#!/bin/bash

# enable pacman
echo "enabling pacman..."

sudo cp /home/deck/dotfiles/scripts/bits/pacman.conf /etc

# configure post transaction hooks
echo "configuring post transaction hooks..."

sudo mkdir -p /etc/pacman.d
sudo cp /home/deck/dotfiles/scripts/bits /etc/pacman.d

# install yay
echo "installing yay..."

cd /home/deck/clones
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd /home/deck

# install packages
echo "installing packages..."

yay -S - < /home/deck/dotfiles/scripts/bits/packages.txt

echo "setup complete"
