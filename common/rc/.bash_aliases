# some more ls aliases
alias ll='ls -alhF'
alias la='ls -Alh'
alias l='ls -CF'

alias mkvenv="virtualenv -p python3 venv"
alias vac="source venv/bin/activate"
alias dac="deactivate"

# Git aliases
alias gco="git checkout"
alias gci="git commit"
alias gps="git push"
alias gpl="git pull"
alias ga="git add"
alias gs="git status"
alias glog="git log --graph --all --decorate --oneline"

# SDKMan aliases
alias java8="sdk use java 8.0.275.j9-adpt"
alias java11="sdk use java 11.0.9.j9-adpt"
alias java15="sdk use java 15.0.1.j9-adpt"

# Kubenetes aliases
alias k=kubectl
alias k12="asdf global kubectl 1.12.9"
alias k18="asdf global kubectl 1.18.2"
