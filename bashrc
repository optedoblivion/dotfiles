
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
export ANDROID_HOME="~/Android"
export AOSP_HOME="$ANDROID_HOME/AOSP/"
export ASDK_HOME="~/Android/SDK"
export ASDK_TOOLS="$ASDK_HOME/tools"
export MYBIN="~/.bin"
export MYTOOLS="~/.tools"
export P4VHOME=""
export ECLIPSE_HOME="$HOME/.ide/eclipse"
export ECLIPSE_BIN=$ECLIPSE_HOME
export FIREFOX_HOME=""
export JAVA_HOME="/opt/java"
export JAVA_BIN="$JAVA_HOME/bin"
export ARM_TOOLCHAIN=/usr/local/arm/3.4.1/bin/

PATH=$PATH:/usr/local/bin:$MYBIN:$MYTOOLS:$P4VHOME:$ECLIPSE_HOME:$FIREFOX_HOME
PATH=$PATH:$AOSP_HOME:$ASDK_HOME:$JAVA_HOME:$JAVA_BIN:$ASDK_TOOLS:$ARM_TOOLCHAIN

export PATH

PS1='[\u@\h \W]\$ '
export EDITOR='vim'
export TERM="xterm"
alias vi='vim $1'

export TODOPATH='$HOME/.bin'
export PATH=$PATH:$TODOPATH
todo
