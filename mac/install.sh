#!/usr/bin/env zsh

set -e -o pipefail

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project root directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read "?Do you want to proceed? (y/N) " resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi

echo "This installation requires sudo. Please enter your password:"
sudo echo "Starting installation..."

# Install Oh-My-Zsh
if [ ! $ZSH ] ; then
	RUNZSH="no"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## Make sure the ZSH variables below are the same as in rc/.zshrc
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$ZSH/custom"

# Install brew. Note: Install requires bash, so cannot be switched to zsh
yes "" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
export PATH=/opt/homebrew/bin:$PATH

# Install git through brew instead of relying on system install
brew install git
brew link --overwrite git

# Configure Git
git config --global pull.ff only
git config --global init.defaultBranch main
git config --global push.autoSetupRemote true

# Install system essentials
brew install openconnect speedtest-cli bfg

# Applications
brew install --cask dbeaver-community # Database management tool
brew install --cask google-chrome
brew install --cask iterm2
brew install --cask karabiner-elements # Karabiner for overriding keys
brew install --cask postman
brew install --cask rectangle # Window manager
brew install --cask scroll-reverser
brew install --cask slack
brew install --cask spotify
brew install --cask stats # System metrics in taskbar
brew install --cask visual-studio-code

# ZSH completions
brew install zsh-completions
chmod -R go-w "$(brew --prefix)/share" # Fix permissions for completions
autoload -Uz compinit
rm -f ~/.zcompdump; compinit # Recompile completions

# Programming languages
# Install python3
brew install python@3.12
brew install python@3.11
sudo ln -sf /opt/homebrew/bin/python3 /opt/homebrew/bin/python
sudo ln -sf /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip
python -m pip install --upgrade pip

curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"
poetry config virtualenvs.in-project true

mkdir -p $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source "$HOME/.nvm/nvm.sh"
nvm install stable

npm install -g yarn

# Install libpq, interface library for PostgreSQL
brew install libpq
brew install openssl

# Install sdkman to handle multiple Java/Groovy/Scala versions
curl -s https://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install java

sdk install gradle

# Change the whitespace in top taskbar to enable more icons
defaults -currentHost write -globalDomain NSStatusItemSelectionPadding -int 6
defaults -currentHost write -globalDomain NSStatusItemSpacing -int 6

# Hide Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 1000
killall Dock # Restart Dock to activate changes

# Symlink dotfiles
source mac/update.sh
