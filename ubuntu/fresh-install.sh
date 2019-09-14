#!/usr/bin/env bash

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project root directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read -p 'Do you want to proceed? (y/N) ' resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi


sudo apt update
sudo apt upgrade -y

# Install system essentials
sudo apt install -y vim git curl openconnect speedtest-cli

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
./ubuntu/programs/spotify.sh
./ubuntu/programs/google-chrome.sh
./ubuntu/programs/visual-studio-code.sh
./ubuntu/programs/slack.sh
./ubuntu/programs/gnome-desktop.sh
./ubuntu/programs/docker.sh

# Symlink dotfiles
./ubuntu/update.sh
