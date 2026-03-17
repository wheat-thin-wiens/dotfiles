#!/bin/bash

# be sure to run from the root directory of a git repo
function gh-reset() {
  echo "resetting git credential manager"

  GHPATH=$(which gh)

  git config --global --unset-all credential.helper
  git config --global --unset gh.path
  git config --global --unset gh.hosts.github.com

  git config --unset credential.helper
  git config --unset gh.path

  sudo git config --system --unset-all credential.helper
  sudo git config --system --unset gh.path

  git config --global gh.path $GHPATH
  git config --global credential.helper $GHPATH

  echo "git credential manager has been set to use $GHPATH"
}
