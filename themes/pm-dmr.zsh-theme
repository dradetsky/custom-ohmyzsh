#!/usr/bin/zsh
#
# based on:
#
# https://superuser.com/questions/1027957

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}|%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PRE_PROMPT='%{$fg[cyan]%}%#%{$reset_color%} '
# post prompt is basically $RPS1$PRE_PROMPT
POST_PROMPT='%{$fg[white]%}%~$(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
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
