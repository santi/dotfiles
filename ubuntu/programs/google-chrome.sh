#!/usr/bin/env bash

# https://www.ubuntuupdates.org/ppa/google_chrome

echo "Installing Google Chrome"

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

