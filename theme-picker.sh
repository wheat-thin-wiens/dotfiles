#!/bin/zsh

function colorpick {
  if [ $1 = 'list' ]; then
    bat ~/dotfiles/themes.md

  else
    rm -f ~/dotfiles/starship/.config/starship.toml
    cp ~/dotfiles/starship/.config/starship_themes/starship_$1.toml ~/dotfiles/starship/.config/starship.toml
    stow starship
    echo "Starship theme updated."

    nvim ~/.config/nvim/lua/vim-options.lua
    echo "Neovim theme updated."

    nvim ~/.wezterm.lua
    echo "WezTerm theme updated."

    # rm -f ~/dotfiles/yazi/.config/yazi/theme.toml
    # cd ~/dotfiles/yazi/.config/yazi/themes
    # cp $1.toml ~/dotfiles/yazi/.config/yazi/theme.toml
    # cd -
    # cd ~/dotfiles
    # stow yazi
    # cd -
    # echo "Yazi theme updated"

    echo "Transparency options for neovim may need to be changed in themes.lua"
  fi
}

