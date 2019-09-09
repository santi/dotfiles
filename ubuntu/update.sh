#!/usr/bin/env bash

[[ -e rc/ ]] || { echo >&2 "Please cd into the project directory before running this script."; exit 1; }

# Symlink dotfiles

ln -sf $PWD/rc/.bashrc ~/.bashrc
ln -sf $PWD/rc/.bash_aliases ~/.bash_aliases

echo "Symlinks updated"

