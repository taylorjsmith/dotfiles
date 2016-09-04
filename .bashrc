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

# username colour
case $(id -u) in
    0)
        UserColour=$Red;
        ;;
    *)
        UserColour=$Blue;
        ;;
esac

# git tools
. /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash;
. /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh;

# git tools options
GIT_PS1_SHOWDIRTYSTATE="yes"
GIT_PS1_SHOWSTASHSTATE="yes"
GIT_PS1_SHOWUNTRACKEDFILES="yes"
GIT_PS1_SHOWUPSTREAM="auto"

# git tools prompt
if [ "\$(type -t __git_ps1)" ]; then
    Branch="\$(__git_ps1 ' (%s)')"
fi

# customize prompt
if [ "$SSH_CONNECTION" == "" ]; then
    export PS1="$UserColour\u$White@$Green\h$White:\w$Branch$White>$ColourOff "
else
    export PS1="$UserColour\u$White@$Yellow\h$White:\w$Branch$White>$ColourOff "
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