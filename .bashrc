####################
# .bashrc
# Taylor J. Smith
####################

# if not running interactively, do nothing
[ -z "$PS1" ] && return

# source bash_aliases file
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases;
fi

# ANSI colour codes
ColourOff="\[\033[0m\]"
Black="\[\033[0;30m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Blue="\[\033[0;34m\]"
Magenta="\[\033[0;35m\]"
Cyan="\[\033[0;36m\]"
White="\[\033[0;37m\]"

# customize prompt
if [ "$SSH_CONNECTION" == "" ]; then
    PS1="$Blue\u$White@$Green\h$White:\w>$ColourOff "
else
    PS1="$Blue\u$White@$Yellow\h$White:\w>$ColourOff "
fi

# editor preference
export EDITOR=/usr/bin/vim

# command line colours
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

# man page colours
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# misc
eval "$(thefuck --alias)"
