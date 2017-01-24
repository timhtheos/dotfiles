##
# Set export path to Oh My Zsh installation.
export ZSH=~/.oh-my-zsh

##
# Set zsh theme path.
ZSH_THEME="timothy"

##
# Set Oh My Zsh miscellaneous settings.
  # Set auto update.
  DISABLE_AUTO_UPDATE="false"

  # Set auto update frequency.
  export UPDATE_ZSH_DAYS=30

  # Set other settings.
  # DISABLE_AUTO_TITLE="true"
  # ENABLE_CORRECTION="true"
  # ZSH_CUSTOM=/path/to/new-custom-folder
  # CASE_SENSITIVE="true"

##
# Set Oh My Zsh plugins.
# Note: For vi-mode on OSX, do not use Apple's git; instead use brew's git.
# Reference: https://github.com/robbyrussell/oh-my-zsh/issues/2189
plugins=(
  vi-mode
  z
  history-substring-search
  rvm
  ruby
)

##
# Export paths.
  # Export composer path.
  export PATH="$PATH:$HOME/.composer/vendor/bin"
  
  # Export local sbin.
  export PATH="/usr/local/sbin:$PATH"
  
  # Export user/personal bin.
  export PATH=~/.bin:$PATH
  
  # Export rvm bin.
  export PATH="$PATH:$HOME/.rvm/bin"
  
  # Export user/personal git bin.
  export PATH=~/.git-bin:$PATH

  # Set python path (for use in mopidy).
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH

##
# Source Oh My Zsh.
source $ZSH/oh-my-zsh.sh

  # Map jk, JK to toggle vi-mode.
  bindkey -M viins 'jk' vi-cmd-mode
  bindkey -M viins 'JK' vi-cmd-mode

  # Kill delay lag when ESC is hit.
  # export KEYTIMEOUT=1

  # Set color of modal cursor for vi's insert, normal modes.
  # Source: http://micahelliott.com/posts/2015-07-20-vim-zsh-tmux-cursor.html
  # zle-keymap-select () {
  #   echo -ne "\033]12;Grey\007"
  #   echo -ne "\033[4 q"
  # }
  # zle -N zle-keymap-select
  # zle-line-init () {
  #   zle -K viins
  #   echo -ne "\033]12;Gray\007"
  #   echo -ne "\033[4 q"
  # }
  # zle -N zle-line-init

##
# Set language environment 
export LANG=en_US.UTF-8

##
# Set preferred editor.
export EDITOR='vim'

##
# Source, configure FZF.
  # Source FZF.
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # Ignore duplicate commands in FZF history.
  HIST_IGNORE_ALL_DUPS="true"
  setopt hist_ignore_dups

##
# Set custom aliases.
alias bored="fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.03/share/cows | gshuf -n1)"
alias clock1='while true; do tput clear; date +"                                                                                                         %l : %M : %S %p" | figlet -c | toilet -F gay -f term; sleep 1; done'
alias clock2='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F gay -f smmono9; sleep 1; done'
alias clock3='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F metal -f smmono9; sleep 1; done'

##
# Set the fuck.
# eval "$(thefuck --alias)"

##
# Export docker environments.
source ~/.docker-exports

##
# Set github hub alias.
eval "$(hub alias -s)"

##
# Start mpd automatically, if not yet running.
# if [[ -z "$(pgrep mpd)" ]]; then
#   mpd
# fi

##
# Set teamocil zsh autocompletion.
compctl -g '~/.teamocil/*(:t:r)' teamocil

##
# Export brew github api token.
export HOMEBREW_GITHUB_API_TOKEN='b9a3635b81f2a573d94ca3ffdb8c6bdd41bdbede'

export NVM_DIR="/Users/timothy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

