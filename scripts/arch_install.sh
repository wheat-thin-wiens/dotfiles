#!/bin/bash

set -euo pipefail

## FORMAT DISKS ##
select_disk() {
  mapfile -t drives < <(lsblk -d -n -p -o NAME,SIZE,MODEL | \
    grep -E 'nvme|sd|vd' | \
    sed 's|^/dev/||')

  if [ ${#drives[@]} -eq 0 ]; then
    echo "Error: No suitable drives found."
    exit 1
  fi

  local i=1
  local -A drive_map

  for entry in "${drives[@]}"; do
    local name size model
    read -r name size model <<< "$entry"

    drive_map[$i]="$name"
    printf "%2d. /dev/%s   (%s)   %s\n" "$i" "$name" "$size" "$model"

    ((i++))
  done
  
  echo ""
  read -rp "Select drive: " choice

  if ! [[ "$choice" =~ ^[0-9]+$ ]] || [ -z "${drive_map[$choice]:-}" ]; then
    echo "invalid selection"
    exit 1
  fi

  target_drive="/dev/${drive_map[$choice]}"
  echo ""
  echo "Selected: $target_drive"
  echo ""

  partition_disk "$target_drive"
}

partition_disk() {
  local target="$1"
  read -p "Enter size of swap partition: " swap_size

  wipefs -a "$target"

  fdisk "$target" <<EOF
g
n
1
+1G
t
1

n
2
+${swap_size}
t
2
19

n
3

w

EOF

  echo "Informing kernel of partition changes..."
  partprobe "$target"
  sleep 3

  if [[ "$target" == *"nvme"* ]] || [[ "$target" == *"mmcblk"* ]]; then
    local p="p"
  else
    local p=""
  fi

  export EFI_PART="${target}${p}1"
  export SWAP_PART="${target}${p}2"
  export ROOT_PART="${target}${p}3"

  echo "creating boot fs"
  mkfs.fat -F32 ${EFI_PART}
  echo ""

  echo "creating swap"
  mkswap ${SWAP_PART} && swapon ${SWAP_PART}

  echo "Select filesystem type: (1)ext4 (2)btrfs"
  read -p "> " fs_choice

  case "$fs_choice" in
    1)
      mkfs.ext4 ${ROOT_PART}
    ;;
    2)
      mkfs.btrfs -f ${ROOT_PART}
    ;;
  esac
  
}

## PACSTRAP ##
pacman_init() {
  pacman-key --init
  pacman-key --populate archlinux
}
