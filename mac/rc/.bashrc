# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Nvm automatically adds snippet to .bashrc. This variable prevents SDK to re-add configuration on common .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install Git completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Source common configuration
. ~/.common.bashrc

# Setup Gradle with hardcoded path. Getting the path from brew takes too long
export GRADLE_USER_HOME=/usr/local/Cellar/gradle/5.6.1

# Add global node_modules to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add libraries managed by asdf to PATH
export PATH=$PATH:$HOME/.asdf/shims
