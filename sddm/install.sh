#!/usr/bin/bash

sudo rm -rf /etc/sddm.conf
sudo ln -s ~/dotfiles/sddm/etc/sddm.conf /etc/sddm.conf

sudo rm -rf /usr/share/sddm/themes
sudo ln -s ~/dotfiles/sddm/usr/share/sddm/themes /usr/share/sddm/themes

sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
