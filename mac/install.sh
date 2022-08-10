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

# Install git through brew instead of relying on system install
brew install git
brew link --overwrite git

# Configure Git
git config --global pull.ff only
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true

# Install system essentials
brew install openconnect speedtest-cli bash-completion bfg

# Applications
brew install --cask dbeaver-community # Database management tool
brew install --cask docker
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask karabiner-elements # Karabiner for overriding keys
brew install --cask postman
brew install --cask rectangle # Rectangle window manager
brew install --cask scroll-reverser
brew install --cask slack
brew install --cask spotify
brew install --cask stats # Stats system monitor
brew install --cask visual-studio-code

# Programming languages
# Install python3
brew install python
sudo ln -sf /opt/homebrew/bin/python3 /opt/homebrew/bin/python
sudo ln -sf /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip
python -m pip install --upgrade pip

# Install poetry, Python package manager
brew install poetry

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable

npm install -g yarn

# Install libpq, interface library for PostgreSQL
brew install libpq

# Install sdkman to handle multiple Java/Groovy/Scala versions
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java

brew install gradle

# Symlink dotfiles
. mac/update.sh
