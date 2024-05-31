# Linux Notes

## Arch Install

### Pre-Install

- Need the following items to get started:
  - arch .iso file
  - Freshly formatted flas drive (ExFAT format works fine)
  - Either balenaetcher on mac or rufus on windows
- Flash the .iso file to the flash drive

### Install

- Turn on computer
  - Ensure flash drive and ethernet are both plugged in
- When prompted, enter `archinstall` into the command line
- Select language
- Select mirror region
- Disk configuration
  - Use best effort default partition layout
  - For portable install, select boot disk as the partition
  - Select btrfs as filesystem for main partition
  - Use default structure
  - Use compression
- Select Grub as bootloader
- Configure hostname if desired
- Set root password
- Add a user and set user password
  - Make sure new user is set as a superuser
- Select pipwire as audio server
- Select linux kernel
- Use NetworkManager for network configuration
- Select timezone
- Select install

### Post-Install

- Install Gnome desktop environment
  - Select yes when prompted to chroot into newly created installation
  - Enter `pacman -S gnome`
  - Press enter to install all packages
- After installing Gnome:
  - Enter command `exit` to exit `chroot`
  - Shutdown using `shutdown -h now` command
- Enable service for GDM:
  - Reboot system and select boot into existing OS from bootloader
  - Log in with user credentials
  - Enter `sudo systemctl enable gdm.service` and provide root password
  - Once the service has been enabled, enter `sudo systemctl start gdm.service`
    - This will enter Gnome and configure it to run on startup

## Packages

- alacritty
- firefox
- hyprland / kitty
- i3
- lua
- neofetch
- neovim
- python
- tmux
- ttf-meslo-nerd

## Bluetooth Setup

To enable bluetooth, enter the following commands into the terminal:

- Enter `systemctl start bluetooth`, will be prompted for root password
- Enter `systemctl enable bluetooth`, will again be prompted for root password

This will enable bluetooth and configure it to run on startup
