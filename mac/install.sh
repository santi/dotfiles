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

# Install system essentials
brew install openconnect speedtest-cli

# Install Spectacle window manager
brew install --cask spectacle

# Install iterm2
brew install --cask iterm2

# Install Google Chrome
brew install --cask google-chrome

# Install Visual Studio Code
brew install --cask visual-studio-code

# Install python3
brew install python
sudo ln -sf /usr/local/bin/python3 /usr/local/bin/python
sudo ln -sf /usr/local/bin/pip3 /usr/local/bin/pip
python -m pip install --upgrade pip
pip install virtualenv

# Install python2
brew install python2
sudo ln -sf /usr/bin/python2.7 /usr/local/bin/python2

# Install slack
brew install --cask slack

# Install spotify
brew install --cask spotify

# Install Intellij
brew install --cask intellij-idea

# Install Android Studios
brew install --cask android-studio

# Install Gradle
brew install gradle

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.nvm/nvm.sh
nvm install stable

npm install -g yarn

# Install docker
brew install --cask docker

# Install Karabiner for overriding keys
brew install --cask karabiner-elements

# Install libpq
brew install libpq

# Install asdf for handling multiple versions of libraries
brew install asdf

# Install sdkman to handle multiple Java/Groovy/Scala versions
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install bash completion
brew install bash-completion

# Install latest kubectl
asdf plugin-add kubectl
asdf install kubectl 1.18.2

# Symlink dotfiles
. mac/update.sh
