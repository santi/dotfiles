# START PATH
# Homebrew
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_PREFIX=/opt/homebrew

# Add SDKMAN binaries to path
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add global yarn node_modules to path
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add libpq to path
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Add Poetry to path
export PATH="~/.local/bin:$PATH"
# END PATH

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
ZSH_THEME="robbyrussell"

# START PLUGINS / COMPLETIONS
plugins=(git nvm)
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"
FPATH="$HOMEBREW_PREFIX/share/zsh-completions:${FPATH}"

zstyle ':omz:plugins:nvm' lazy yes
# END PLUGINS / COMPLETIONS

source $ZSH/oh-my-zsh.sh

# START PROMPT
PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[green]%}%~%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'
# END PROMPT

# START HISTORY
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE

setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
# END HISTORY

# START GLOB
setopt GLOB_STAR_SHORT
# END GLOB

# Source common configuration
source ~/.common.rc
