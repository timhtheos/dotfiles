# This theme is originally named as nanotechmod

# Modifications:
# 1. Add live clock into the zsh prompt
# 2. Add customized vi-mode indicator

# vi-mode theme
VI_MODE_NORMAL="%{$bg[yellow]%}%{$fg_bold[black]%} NORMAL %{$reset_color%}"
VI_MODE_INSERT="%{$bg[white]%}%{$fg_bold[yellow]%} INSERT %{$reset_color%}" 

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$VI_MODE_NORMAL}/(main|viins)/$VI_MODE_INSERT}"
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
