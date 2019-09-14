# Gradle
export GRADLE_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')
export GRADLE_USER_HOME=$(brew info gradle | grep /usr/local/Cellar/gradle | awk '{print $1}')
export USER_HOME=$HOME

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "~/.sdkman/bin/sdkman-init.sh" ]] && source "~/.sdkman/bin/sdkman-init.sh"

# Nvm automatically adds snippet to .bashrc. This variable prevents SDK to re-add configuration on common .bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Source common configuration
. ~/.common.bashrc
