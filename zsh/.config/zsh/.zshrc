#!/bin/zsh

[[ $- != *i* ]] && return

bindkey -e
setopt AUTOCD AUTOMENU EXTENDED_GLOB PROMPT_SUBST

ZSHDIR=${ZDOTDIR:-$HOME}

source $ZSHDIR/.zsh_aliases
source $ZSHDIR/.zsh_plugins

unset ZSHDIR

PROMPT='$(lua ${ZDOTDIR:-HOME}/scripts/zsh_prompt.lua)'
RPROMPT='%T'
