#!/bin/bash

uninstall_nvim() {
  rm /usr/local/bin/nvim
  rm -rf /usr/local/share/nvim
  rm -rf /usr/local/lib/nvim
  cd $HOME/clones/nvim && rm -rf build/ && make distclean
}
