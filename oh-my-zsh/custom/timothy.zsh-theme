#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
#          FILE: timothy.zsh-theme
#   DESCRIPTION: A custom zsh theme.
#        AUTHOR: Timothy A. Escopete (me[at]timothyae.com)
#       VERSION: 1.0.0
#       DEPENDS: ZSH
# ------------------------------------------------------------------------------

VI_MODE_NORMAL="%{$fg_bold[white]%}vi-mode%{$reset_color%}"
VI_MODE_INSERT="" 

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$VI_MODE_NORMAL}/(main|viins)/$VI_MODE_INSERT}"
}

PROMPT='
%F{green}%n@%m:$('pwd') %F{white}
$%f '
RPROMPT='$(git_prompt_info) $(vi_mode_prompt_info) %F{green}%D{%L:%M:%S} %F{yellow}%D{%p}%f'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

TMOUT=1

TRAPALRM() {
  zle reset-prompt  
}
