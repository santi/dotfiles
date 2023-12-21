#!/usr/bin/env zsh

[[ -e common/rc/ ]] || { echo >&2 "Please cd into the project root directory before running this script."; exit 1; }

echo "This script will perform a clean system install."
read -p 'Do you want to proceed? (y/N) ' resp

if [ "$resp" != 'y' -a "$resp" != 'Y' ] ; then
	echo "Installation aborted."
	exit 1
fi

echo "This installation requires sudo. Please enter your password:"
sudo echo "Starting installation..."

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# ZSH completions
brew install zsh-completions
chmod -R go-w "$(brew --prefix)/share" # Fix permissions for completions
rm -f ~/.zcompdump; compinit # Recompile completions

# Programming languages
# Install python3
brew install python@3.12
sudo ln -sf /opt/homebrew/bin/python3 /opt/homebrew/bin/python
sudo ln -sf /opt/homebrew/bin/pip3 /opt/homebrew/bin/pip
python -m pip install --upgrade pip

curl -sSL https://install.python-poetry.org | python3 -
export PATH="$HOME/.local/bin:$PATH"
poetry config virtualenvs.in-project true

# Install nvm, node and yarn
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source "$HOME/.nvm/nvm.sh"
nvm install stable

npm install -g yarn

# Install libpq, interface library for PostgreSQL
brew install libpq
brew install openssl

# Install sdkman to handle multiple Java/Groovy/Scala versions
curl -s http://get.sdkman.io | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
yes | sdk install java

sdk install gradle

# Symlink dotfiles
source mac/update.sh
