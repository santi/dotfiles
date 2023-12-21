#!/usr/bin/env zsh

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the root directory of the project before running this script."; exit 1; }

# Symlink dotfiles
ln -sf $PWD/mac/rc/.zshrc $HOME/.zshrc
ln -sf $PWD/common/rc/.common.rc $HOME/.common.rc
ln -sf $PWD/common/rc/.common.aliases $HOME/.common.aliases

echo "Symlinks updated"
