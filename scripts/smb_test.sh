#!/bin/bash

MOUNT_POINT="/media/archlinux"

echo "Checking if mount point exists..."
if [ ! -d "$MOUNT_POINT" ]; then
  echo "Creating directory $MOUNT_POINT..."
  sudo mkdir -p "$MOUNT_POINT"
fi

echo "Reloading systemd daemon to recognize fstab changes..."
sudo systemctl daemon-reload

echo "Attempting to mount all filesystems in fstab..."
sudo mount -a

echo "Checking mount status..."
if mountpoint -1 "$MOUNT_POINT"; then
  echo "SUCCESS: $MOUNT_POINT is mounted"
  ls -l "$MOUNT_POINT"
else
  echo "FAILURE: the drive did not mount. Chekc 'dmesg | tail for errors."
  exit 1
fi
