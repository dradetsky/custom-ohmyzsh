#!/usr/bin/zsh
#
# based on:
#
# https://superuser.com/questions/1027957


# ZSH_THEME_TERM_TAB_TITLE_IDLE="%40<..<%~%<<"
ZSH_THEME_TERM_TAB_TITLE_IDLE='%40<..<$(felix_pwd_abbr)%<<'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}|%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PRE_PROMPT='%{$fg[cyan]%}%#%{$reset_color%} '
# post prompt is basically $RPS1$PRE_PROMPT
if typeset -f felix_pwd_abbr > /dev/null ; then
    POST_PROMPT='%{$fg[white]%}$(felix_pwd_abbr)$(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
else
    POST_PROMPT='%{$fg[white]%}%40<...<%~$(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
fi
RPS1='%{$fg[white]%}%~$(git_prompt_info)%{$reset_color%}'
PROMPT="$PRE_PROMPT"

setopt transient_rprompt

function move-prompt-info-accept-line() {
    PROMPT="$POST_PROMPT"
    zle reset-prompt
    PROMPT="$PRE_PROMPT"
    zle accept-line
}

zle -N move-prompt-info-accept-line
bindkey "^M" move-prompt-info-accept-line
