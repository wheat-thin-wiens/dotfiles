# Installing / Uninstalling Nix

## Installing Nix

- Run the following command:

> `curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`

This command will detail everything it will do, and ask for your permission to perform those actions.

- To test if the installation was successful, run

>`nix run "nixpkgs#hello"`

This will download a set of packages before running the specified package, which will just print "Hello, world!"

Nix is now installed on the machine.

## Uninstalling Nix

1. If the system-wide shell initialization files haven't been altered since installing Nix, use the backups made by the installer:

>`sudo mv /etc/zshrc.backup-before-nix /etc/zshrc`
>`sudo mv /etc/bashrc.backup-before-nix /etc/bashrc`
>`sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc`

Otherwise, edit `/etc/zshrc`, `/etc/bashrc`, and `/etx/bash.bashrc` to remove the lines sourcing `nix-daemon.sh`, which should look like this:

>`# Nix`
>`if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then`
>   `. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'`
>`fi`
>`# End Nix`

2. Stop and remove the Nix daemon services:

>`sudo launchctl unload /Library/LaunchDaemons/org.nixos.nix-daemon.plist`
>`sudo rm /Library/LaunchDaemons/org.nixos.nix-daemon.plist`
>`sudo launchctl unload /Library/LaunchDaemons/org.nixos.darwin-store.plist`
>`sudo rm /Library/LaunchDaemons/org.nixos.darwin-store.plist`

This stops the Nix daemon and prevents it from being started next time you boot the system.

3. Remove the `nixbld` group and the `_nixbuildN` users:

>`sudo dscl . -delete /Groups/nixbld`
>`for u in $(sudo dscl . -list /Users | grep _nixbld); do sudo dscl . -delete /Users/$u; done`

This will remove all the build users that no longer serve a purpose.

4. Edit fstab using `sudo vifs`, or `sudo nvim /etc/fs` to remove the line mounting the Nix Store volume on `/nix`, which looks like:

>`UUID=<uuid> /nix apfs rw,noauto,nobrowse,suid,owners`

or

>`LABEL=Nix\040Store /nix apfs rw,nobrowse`

by setting the cursor on the respective line using the arrow keys, and pressing `dd`, and then `:wq` to save the file.

This will prevent automatic mounting of the Nix Store volume.

5. Edit `/etx/synthetic.conf` to remove the `nix` line. If this is the only line in the file, you can remove it entirely:

>`if [ -f /etc/synthetic.conf ]; then`
>`  if [ "$(cat /etc/synthetic.conf)" = "nix" ]; then`
>`      sudo rm /etc/synthetic.conf`
>`  else`
>`      sudo vi /etc/synthetic.conf`
>`  fi`
>`fi`

This will prevent the creation of the empty `/nix` directory.

6. Remove the files Nix added to your system, except for the store:
>`sudo rm -rf /etc/nix /var/root/.nix-profile /var/root/.nix-defexpr /var/root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels`

7. Remove the Nix Store volume:

>`sudo diskutil apfs deleteVolume /nix`

This will remove the Nix Store volume and everything that was added to the store.

If the output indicates that the command couldn't remove the volume, you should make sure you don't have an *unmounted* Nix Store volume. Look for a "Nix Store" volume in the output of the following command:

>`diskutil list`

If you *do* find a "Nix Store" volume, delete it by running `diskutil deleteVolume` with the store volume's `diskXsY` identifier. Or by running `sudo diskutil apfs deleteVolume diskXsY`.

### Note

After you complete the steps here, you will still have an empty /nix directory. This is an expected sign of a successful uninstall. The empty /nix directory will disappear the next time you reboot.
You do not have to reboot to finish uninstalling Nix. The uninstall is complete. macOS (Catalina+) directly controls root directories, and its read-only root will prevent you from manually deleting the empty /nix mountpoint.

## Nix Darwin

