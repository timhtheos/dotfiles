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
  iterm2-touchbar
)

##
# Export paths.
  # Export composer path.
  export PATH="$PATH:$HOME/.composer/vendor/bin"
  
  # Export local sbin.
  export PATH="/usr/local/sbin:$PATH"
  
  # Export user/personal bin.
  # export PATH=~/.bin:$PATH
  export PATH=$(find ~/.bin -type d | tr '\n' ':' | sed 's/:$//'):$PATH
  
  # Export rvm bin.
  export PATH="$PATH:$HOME/.rvm/bin"

  if [[ -s $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
  fi
  
  # Export user/personal git bin.
  export PATH=~/.git-bin:$PATH

  # Set python path (for use in mopidy).
  export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
  # export PYTHONPATH=$(brew --prefix)/lib/python3.5/site-packages:$PYTHONPATH

  # pip3 issue: https://github.com/Homebrew/legacy-homebrew/issues/33897#issuecomment-61595231

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
alias bored="fortune | cowsay -f $(ls /usr/local/Cellar/cowsay/3.04/share/cows | gshuf -n1)"
alias clock1='while true; do tput clear; date +"                                                                                                         %l : %M : %S %p" | figlet -c | toilet -F gay -f term; sleep 1; done'
alias clock2='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F gay -f smmono9; sleep 1; done'
alias clock3='while true; do tput clear; date +" %l : %M : %S %p" | toilet -F metal -f smmono9; sleep 1; done'
alias count="ls -l | grep -v ^l | wc -l"
#alias apache_stop="sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist"
alias james="echo aUh2x7*4";

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
export HOMEBREW_CASK_OPTS='--caskroom=/opt/homebrew-cask/Caskroom'

export NVM_DIR="/Users/timothy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# From: https://github.com/creationix/nvm#zsh
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# add-zsh-hook chpwd load-nvmrc
# load-nvmrc
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# from
# http://stackoverflow.com/questions/20098862/how-to-install-gtk-on-osx-for-use-with-g-gcc-compiler
export PKG_CONFIG_PATH=/usr/local/Cellar/cairo/1.12.16/lib/pkgconfig/
export PKG_CONFIG_PATH=/usr/X11/lib/pkgconfig

export HISTTIMEFORMAT="%d/%m/%y %T "

# From
# https://blog.frd.mn/install-nginx-php-fpm-mysql-and-phpmyadmin-on-os-x-mavericks-using-homebrew/
# PHP CLI binary
export PATH="/usr/local/sbin:$PATH"

# PHP 70.
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# Include project's git path.
export PATH="/vw/sites/jamesdeakin.dev/build:$PATH"

function countdown(){
  date1=$((`date +%s` + $1)); 
  while [ "$date1" -ge `date +%s` ]; do 
    echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
  done
}
function stopwatch(){
  date1=`date +%s`; 
  while true; do 
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r"; 
    sleep 0.1
  done
}

export PATH="$PATH:$HOME/coder/vendor/bin";
