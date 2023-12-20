#!/usr/bin/env zsh

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the root directory of the project before running this script."; exit 1; }

# Symlink dotfiles
ln -sf $PWD/mac/rc/.zshrc ~/.zshrc
ln -sf $PWD/common/rc/.common.rc ~/.common.rc
ln -sf $PWD/common/rc/.common.aliases ~/.common.aliases

echo "Symlinks updated"
