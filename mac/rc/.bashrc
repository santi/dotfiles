# Silence warning about zsh shell on startup
export BASH_SILENCE_DEPRECATION_WARNING=1

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Add SDKMAN binaries to path
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add global yarn node_modules to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add libpq to path
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Nvm automatically adds snippet to .bashrc. This variable prevents SDK to re-add configuration on common .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable Git completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Source common configuration
. ~/.common.bashrc
