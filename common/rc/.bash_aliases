# some more ls aliases
alias ll='ls -alhF'
alias la='ls -Alh'
alias l='ls -CF'

alias mkvenv="virtualenv -p python3 venv"
alias vac="source venv/bin/activate"
alias dac="deactivate"

# Git aliases
alias gco="git checkout"
__git_complete gco _git_checkout
alias gci="git commit"
__git_complete gci _git_commit
alias gps="git push"
__git_complete gps _git_push
alias gpl="git pull"
__git_complete gpl _git_pull
alias ga="git add"
__git_complete ga _git_add
alias gs="git status"
alias glog="git log --graph --all --decorate --oneline"

# SDKMan aliases
alias java8="sdk use java 8.0.222.j9-adpt"
alias java11="sdk use java 11.0.5.j9-adpt"

# Kubenetes aliases
alias k=kubectl
alias k12="asdf global kubectl 1.12.9"
alias k18="asdf global kubectl 1.18.2"
