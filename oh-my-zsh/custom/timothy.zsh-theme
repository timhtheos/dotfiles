# This theme is originally named as nanotechmod

# Modifications:
# 1. Add live clock into the zsh prompt
#    from http://askubuntu.com/questions/360063/how-to-show-a-running-clock-in-terminal-before-the-command-prompt

  #MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
  VI_MODE_INSERT="NORMAL"
  VI_MODE_NORMAL="INSERT" 

function vi_mode_prompt_info() {
  #echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
  echo "${${KEYMAP/vicmd/$VI_MODE_INSERT}/(main|viins)/$VI_MODE_NORMAL}"
}

PROMPT='%F{green}%2c%F{white} $(vi_mode_prompt_info) [%f '
RPROMPT='$(git_prompt_info) %F{white}] %F{green}%D{%L:%M:%S} %F{yellow}%D{%p}%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

TMOUT=1

TRAPALRM() {
  zle reset-prompt  
}


