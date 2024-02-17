# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 15   # check for updates every 15 days

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

alias lla='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [[ $(uname -r) == *WSL ]]; then
    alias explorer='/mnt/c/Windows/explorer.exe || true'
fi
export UID=$(id -u)
export GID=$(id -g)

export PATH=~/.local/bin:$PATH


# this should always be the last line of the file
eval "$(starship init zsh)"
