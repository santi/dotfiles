# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# Silence warning about zsh shell on startup
export BASH_SILENCE_DEPRECATION_WARNING=1

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Nvm automatically adds snippet to .bashrc. This variable prevents SDK to re-add configuration on common .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Install Git completion
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# Source common configuration
. ~/.common.bashrc

# Add global node_modules to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add libraries managed by asdf to PATH
. $(brew --prefix asdf)/asdf.sh
export PATH=$PATH:$HOME/.asdf/shims

# The next line updates PATH for the Google Cloud SDK.
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc"
