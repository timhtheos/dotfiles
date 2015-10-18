##
# Custom settings for my zsh, and oh-my-zsh
##

# Ignore duplicate commands in history
# Foc FZF
HIST_IGNORE_ALL_DUPS="true"
setopt hist_ignore_dups

# Theme
ZSH_THEME="timothy"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH
# For scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Live clocks
alias clock1='while true; do tput clear; date +"                                                                                                         %l : %M : %S %p" | figlet -c | toilet -F gay -f term; sleep 1; done'
alias clock2='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F gay -f smmono9; sleep 1; done'
alias clock3='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F metal -f smmono9; sleep 1; done'

# Tmuxinator
#source ~/.bin/tmuxinator.zsh

# Add path
export PATH=/Users/timothy/bin:$PATH

# Alias composer.phar
alias composer="php composer.phar"

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
