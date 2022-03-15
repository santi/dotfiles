#!/usr/bin/env bash

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project root directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read -p 'Do you want to proceed? (y/N) ' resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi

echo "This installation requires sudo. Please enter your password:"
sudo echo "Starting installation..."


# Install brew
yes "" | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
export PATH=/opt/homebrew/bin:$PATH

#Install git through brew instead of relying on system install
brew install git
brew link --overwrite git

# Install system essentials
brew install openconnect speedtest-cli

# Install Spectacle window manager
brew install --cask rectangle

# Install Scroll Reverser
brew install --cask scroll-reverser

# Install iterm2
brew install --cask iterm2

# Install Google Chrome
brew install --cask google-chrome

# Install Visual Studio Code
brew install --cask visual-studio-code

# Install Postman
brew install --cask postman

# Install python3
brew install python
sudo ln -sf /opt/homebrew/bin/python3 /opt/homebrew/bin/python
sudo ln -sf /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip
python -m pip install --upgrade pip
pip install virtualenv

# Install slack
brew install --cask slack

# Install spotify
brew install --cask spotify

# Install Gradle
brew install gradle

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable

npm install -g yarn

# Install docker
brew install --cask docker

# Install DBeaver
brew install --cask dbeaver-community

# Install Karabiner for overriding keys
brew install --cask karabiner-elements

# Install libpq, interface library for PostgreSQL
brew install libpq

# Install asdf for handling multiple versions of libraries
brew install asdf

# Install sdkman to handle multiple Java/Groovy/Scala versions
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install latest stable java
sdk install java

# Install bash completion
brew install bash-completion

# Install Gcloud
brew install google-cloud-sdk

# Install latest kubectl
asdf plugin-add kubectl
asdf install kubectl 1.18.2

# Configure Git
git config --global pull.ff only

# Add BFG tool to cleanup Git history
brew install bfg

# Symlink dotfiles
. mac/update.sh
