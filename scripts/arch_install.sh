#!/bin/bash

set_hostname() {
  local host
  read -p "Enter hostname > " host
  echo ($host) > /etc/hostname
}

grub_init() {
  pacman -S \
    grub \
    efibootmgr \
    os-prober

  local is_uefi confirm

  if command -v efibootmgr >/dev/null 2>&1 && efibootmgr >/dev/null 2>&1; then
    echo "UEFI system detected"
    is_uefi=true
  else
    echo "BIOS system detected - Did you make sure Secure Boot and TPM were disabled?"
    echo "Please confirm before proceeding"
    read -p "1 - continue, 2 - cancel" confirm

    case "$confirm" in 
      1)
        is_uefi=false
        echo "proceeding with BIOS install..."
        ;;
      2)
        echo "GRUB install aborted"
        return 1
        ;;
    esac
  fi

  if [[ $is_uefi==true ]]; then
    echo "Installing GRUB for UEFI"
    grub-install \
      --target=x86_64-efi \
      --efi-directory=/boot \
      --bootloader-id=GRUB

    grub mkconfig -o /boot/grub/grub.cfg
  else
    echo "Installing GRUB for BIOS"
    # TODO: Add a way to detect device with /boot partition
    # grub-install \
    #   --target=i386-pc \
    #   /dev/nvme0n1

    grub mkconfig -o /boot/grub/grub.cfg
  fi
}

package_basics() {
  pacman -S --needed \
    base-devel \
    bluez \
    bluez-utils \
    curl \
    ghostty \
    git \
    go \
    ly \
    neovim \
    networkmanager \
    pavucontrol \
    pipewire \
    reflector \
    stow \
    sudo \
    ufw \
    wget \
    xdg-user-dirs || {
      echo "basic packages failed to install" >&2
      return 1
    }
}

package_hypr() {
  pacman -S \
    ghostty \
    hyprland \
    rofi \
    waybar || {
      echo "hypr packages failed to install" >&2
      return 1
    }
}

package_plasma() {
  pacman -S \
    bluedevil \
    ghostty \
    nemo \
    plasma-desktop \
    plasma-nm \
    sddm || {
      echo "plasma packages failed to install" >&2
      return 1
    }
}

systemd_services() {
  systemctl enable \
    bluetooth \
    ly@tty1.service \
    NetworkManager \
    ufw
}

clock_init() {
  ln -sf /usr/share/zoneinfo/US/Central/etc/localtime

  hwclock --systohc

  echo "timedatectl output:"
  timedatectl

  echo "date output:"
  date

  local confirm
  read -p "Okay to proceed? [y/n]: " confirm
  if [[ $confirm=="n" ]]; then
    echo "Aborting..."
    return 1
  else
    return 0
  fi
}

locale_init() {
  locale-gen

  echo "LANG=en_US.UTF-8" > /etc/locale.conf
}

mirror_init() {
  reflector \
    --verbose \
    --latest 10 \
    --number 5 \
    --country "United States" \
    --sort rate \
    --save /etc/pacman.d/mirrorlist

  pacman -Syu
}

ufw_init() {
  ufw allow 22 80 443
  ufw limit ssh
}
