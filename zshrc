# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Path to theme (custom)
ZSH_THEME="timothy"

# OMZSH update settings
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=30

# Other settings
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# ZSH_CUSTOM=/path/to/new-custom-folder
# CASE_SENSITIVE="true"

# Plugins (Oh My ZSH)
# For vi-mode on OSX, do not use Apple's git.
# https://github.com/robbyrussell/oh-my-zsh/issues/2189
plugins=(
  vi-mode
  z
)

# Paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Paths: User bin to PATH
export PATH=~/bin:$PATH

# Paths: RVM to PATH
export PATH="$PATH:$HOME/.rvm/bin"

# This is here by default, nevermind
source $ZSH/oh-my-zsh.sh

# Set language environment 
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi
export EDITOR='vim'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF: Ignore duplicate commands in history
HIST_IGNORE_ALL_DUPS="true"
setopt hist_ignore_dups

# Aliases
alias bored="fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1)"
alias clock1='while true; do tput clear; date +"                                                                                                         %l : %M : %S %p" | figlet -c | toilet -F gay -f term; sleep 1; done'
alias clock2='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F gay -f smmono9; sleep 1; done'
alias clock3='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F metal -f smmono9; sleep 1; done'
#alias composer="composer.phar"

# Tmuxinator
# source ~/bin/tmuxinator.zsh

# ZSH vi-mode map substitute for ESC
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'JK' vi-cmd-mode

# Kill The Lag / delay when you hit ESC
#export KEYTIMEOUT=1

# Modal cursor color for vi's insert/normal modes.
# Source: http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
#zle-keymap-select () {
#  echo -ne "\033]12;Grey\007"
#  echo -ne "\033[4 q"
#}
#zle -N zle-keymap-select
#zle-line-init () {
#  zle -K viins
#  echo -ne "\033]12;Gray\007"
#  echo -ne "\033[4 q"
#}
#zle -N zle-line-init

# The fuck
eval "$(thefuck --alias)"

# Docker env exports
source ~/.docker-exports

# Github hub aliasing
eval "$(hub alias -s)"
