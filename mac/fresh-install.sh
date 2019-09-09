#!/usr/bin/env bash

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read -p 'Do you want to proceed? (y/N) ' resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi


# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install system essentials
brew install openconnect speedtest-cli

# Install iterm2
brew cask install iterm2

# Install Google Chrome
brew cask install google-chrome

# Install Visual Studio Code
brew cask install visual-studio-code

# Install python3
brew install python
sudo ln /usr/local/bin/python3 /usr/local/bin/python
sudo ln /usr/local/bin/pip3 /usr/local/bin/pip
pip install virtualenv

# Install java
brew cask install java

# Install slack
brew cask install slack

# Install spotify
brew cask install spotify

# Install Intellij
brew cask install intellij-idea

# Install Android Studios
brew cask install android-studio

# Install Gradle
brew install gradle

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable

npm install -g yarn

# Install docker
brew cask install docker

# Install kubernetes CLI
brew install kubernetes-cli

# Symlink dotfiles
./update.sh