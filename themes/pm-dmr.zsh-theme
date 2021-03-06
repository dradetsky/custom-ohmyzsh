#!/usr/bin/zsh
#
# based on:
#
# https://superuser.com/questions/1027957

if typeset -f dmr_pwd_abbr > /dev/null ; then
    function prompt_path_info() {
        dmr_pwd_abbr
    }
elif typeset -f felix_pwd_abbr > /dev/null ; then
    function prompt_path_info() {
        felix_pwd_abbr
    }
else
    function prompt_path_info() {
        '%40<...<%~'
    }
fi

ZSH_THEME_TERM_TAB_TITLE_IDLE='%40<..<$(prompt_path_info)%<<'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}|%{$reset_color%}%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

PRE_PROMPT='%{$fg[cyan]%}%#%{$reset_color%} '
# post prompt is basically $RPS1$PRE_PROMPT
POST_PROMPT='%{$fg[white]%}$(prompt_path_info)$(git_prompt_info)%{$fg[cyan]%}%#%{$reset_color%} '
RPS1='%{$fg[white]%}%~$(git_prompt_info)%{$reset_color%}'
PROMPT="$PRE_PROMPT"

setopt transient_rprompt

autoload -U add-zsh-hook

_DMR_LAST_CMD_PWD="${HOME}"

function save-pwd-after-command() {
    _DMR_LAST_CMD_PWD="$PWD"
}

add-zsh-hook preexec save-pwd-after-command

function move-prompt-info-accept-line() {
    if [[ "$PWD" != "$_DMR_LAST_CMD_PWD" ]] ; then
        PROMPT="$POST_PROMPT"
        zle reset-prompt
        PROMPT="$PRE_PROMPT"
    fi
    zle accept-line
}

zle -N move-prompt-info-accept-line
bindkey "^M" move-prompt-info-accept-line
