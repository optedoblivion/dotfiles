#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## ANSI Colors
BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
OTHER_GREEN="\[\033[1;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
DEFAULT="\[\033[0m\]"

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

export PS1="$LIGHT_GRAY[$GREEN\u@\h $OTHER_GREEN\w$LIGHT_GRAY $LIGHT_RED\$(date +%H:%M)$LIGHT_GRAY]\$(parse_git_branch)$DEFAULT\$ "

alias ls='ls --color=auto'

PATH=~/.bin:$PATH
export PATH
