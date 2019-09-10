#!/usr/bin/env bash

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project directory before running this script."; exit 1; }

# Symlink dotfiles

ln -sf $PWD/common/rc/.bash_profile ~/.bash_profile
ln -sf $PWD/common/rc/.bashrc ~/.bashrc
ln -sf $PWD/common/rc/.bash_aliases ~/.bash_aliases

echo "Symlinks updated"

