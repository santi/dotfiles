#!/usr/bin/env bash

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the root directory of the project before running this script."; exit 1; }

# Symlink dotfiles
ln -sf $PWD/mac/rc/.bashrc ~/.bashrc
ln -sf $PWD/common/rc/.bashrc ~/.common.bashrc
ln -sf $PWD/common/rc/.bash_aliases ~/.bash_aliases
ln -sf $PWD/common/rc/.bash_profile ~/.bash_profile

echo "Symlinks updated"
