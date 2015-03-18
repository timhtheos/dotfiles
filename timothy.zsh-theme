# This theme is originally named as nanotechmod

# Modifications:
# 1. Add live clock into the zsh prompt
#    from http://askubuntu.com/questions/360063/how-to-show-a-running-clock-in-terminal-before-the-command-prompt

PROMPT='%F{green}%2c%F{white} > %D{%L:%M:%S} [%f '
RPROMPT='$(git_prompt_info) %F{white}] %F{green}%D{%L:%M} %F{yellow}%D{%p}%f '

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

TMOUT=1

TRAPALRM() {
  zle reset-prompt  
}
