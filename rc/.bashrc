# Set vim to default editor
export VISUAL=vim
export EDITOR="$VISUAL"


# Add Node Version Manger to path
# https://github.com/creationix/nvm#git-install
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
