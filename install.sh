#!/usr/bin/env bash

sudo echo "Init script started"

sudo apt update
sudo apt upgrade -y

# install system essentials
sudo apt install -y vim git


# install programming languages and utilities
# Python3
sudo apt install -y python3 python3-pip python3-dev
sudo ln /usr/bin/python3 /usr/bin/python
sudo ln /usr/bin/pip3 /usr/bin/pip

# Install programs
./programs/spotify.sh
./programs/google-chrome.sh
