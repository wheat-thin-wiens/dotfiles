#!/bin/bash

echo "
██╗████████╗███████╗     █████╗ ██████╗  ██████╗██╗  ██╗    ████████╗██╗███╗   ███╗███████╗
██║╚══██╔══╝██╔════╝    ██╔══██╗██╔══██╗██╔════╝██║  ██║    ╚══██╔══╝██║████╗ ████║██╔════╝
██║   ██║   ███████╗    ███████║██████╔╝██║     ███████║       ██║   ██║██╔████╔██║█████╗  
██║   ██║   ╚════██║    ██╔══██║██╔══██╗██║     ██╔══██║       ██║   ██║██║╚██╔╝██║██╔══╝  
██║   ██║   ███████║    ██║  ██║██║  ██║╚██████╗██║  ██║       ██║   ██║██║ ╚═╝ ██║███████╗
╚═╝   ╚═╝   ╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝       ╚═╝   ╚═╝╚═╝     ╚═╝╚══════╝
"

# Update pacman mirrors
echo -n "Updating pacman mirrors... "
sudo reflector --protocol https --country "United States" --latest 5 --sort age --save /etc/pacman.d/mirrorlist 
echo "Done."

# Creating home directories
echo -n "Creating directories... "
mkdir ~/dev ~/clones ~/projects
echo "Done."

# Clone neovim plugin projects
echo -n "Retrieving nvim projects... "
git clone https://github.com/wheat-thin-wiens/rei.nvim ~/projects/rei.nvim
git clone https://github.com/wheat-thin-wiens/stat_bastard.nvim ~/projects/stat_bastard.nvim
echo "Done."

# Install yay
echo -n "Installing yay... "
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~/clones/yay
cd ~/clones/yay
makepkg -si
cd
echo "Done."

# Installing packages
yay -S - < ~/dotfiles/packages.txt

# Enabling systemd services
echo "Enabling systemd services... "
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now grub-btrfsd.service
sudo systemctl enable --now iwd.service
sudo systemctl enable --now ly.service
sudo systemctl enable --now mullvad-daemon.service
sudo systemctl enable --now NetworkManager.service
echo "Done."
