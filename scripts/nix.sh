#!/bin/bash

function nix-install() {
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
}

function nix-enable() {
  sudo systemctl enable --now nix-daemon
}

function nix-pkg() {
  nix-env -iA nixpkgs.$1
}

function nix-install-pkgs() {
  sudo systemctl enable --now nix-daemon

  nix-env -iA nixpkgs.bat
  nix-env -iA nixpkgs.eza
  nix-env -iA nixpkgs.fastfetch
  nix-env -iA nixpkgs.gcc-wrapper
  nix-env -iA nixpkgs.gh
  nix-env -iA nixpkgs.go
  nix-env -iA nixpkgs.gopls
  nix-env -iA nixpkgs.jetbrains-mono
  nix-env -iA nixpkgs.lua
  nix-env -iA nixpkgs.lua-language-server
  nix-env -iA nixpkgs.mypy
  nix-env -iA nixpkgs.neovim
  nix-env -iA nixpkgs.opencode
  nix-env -iA nixpkgs.python312
  nix-env -iA nixpkgs.sqlite
  nix-env -iA nixpkgs.starship
  nix-env -iA nixpkgs.stow
  nix-env -iA nixpkgs.tailwindcss-language-server
  nix-env -iA nixpkgs.typescript-language-server
  nix-env -iA nixpkgs.yarn
  nix-env -iA nixpkgs.yazi
}

function nix-clean() {
  nix-env --delete-generations old

  nix-collect-garbage -d
}

function nix-update() {
  echo "please wait until task is finished"
  nix-env --upgrade
  echo "done"
}
