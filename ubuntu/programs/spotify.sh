#!/usr/bin/env bash

# From https://www.spotify.com/no/download/linux/

echo "Installing native Spotify client"

curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get update

sudo apt-get install -y spotify-client

