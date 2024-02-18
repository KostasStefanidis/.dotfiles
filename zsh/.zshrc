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

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='code'
fi

if [ -f $HOME/.zsh_profile ]; then
    source $HOME/.zsh_profile
fi

if [ -f $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

# Activate starship shell prompt
eval "$(starship init zsh)" # this should always be the last line of the file
