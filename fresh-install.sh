#!/usr/bin/env bash

[[ -e rc/ ]] || { echo >&2 "Please cd into the project directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read -p 'Do you want to proceed? (y/N) ' resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi


sudo apt update
sudo apt upgrade -y

# Install system essentials
sudo apt install -y vim git curl openconnect

# Install programming languages and utilities
## Python3
sudo apt install -y python3 python3-pip python3-dev python3-tk
sudo ln /usr/bin/python3 /usr/bin/python
sudo ln /usr/bin/pip3 /usr/bin/pip
sudo pip install virtualenv

## Java
sudo apt install -y default-jdk

## Node Version Manager
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash


# Install programs
./programs/spotify.sh
./programs/google-chrome.sh
./programs/visual-studio-code.sh
./programs/slack.sh
./programs/gnome-desktop.sh
./programs/docker.sh

# Symlink dotfiles
./update.sh


# nå har jeg endret denne filen.

