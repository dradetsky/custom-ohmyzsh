#!/usr/bin/zsh
#
# mildly-customized version of terminalparty

PROMPT="%{$fg[cyan]%}%#%{$reset_color%} "
RPS1='%{$fg[white]%}%~$(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}|%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
