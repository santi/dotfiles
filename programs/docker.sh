#!/usr/bin/env bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository

echo "Installing Docker"

sudo apt update
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
sudo apt install -y docker-ce
