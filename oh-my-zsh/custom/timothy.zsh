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

# Perl churva
PERL_MB_OPT="--install_base \"/Users/timothy/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/timothy/perl5"; export PERL_MM_OPT;

# EV Aliases
alias composer="php /usr/bin/composer.phar"
alias behat="php /vw/elephantventures/agency-environment/elephantventures/sites/all/tests/vendor/behat/behat/bin/behat"

# EV Exports
#source ~/.evrc

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
