####################
# .bash_aliases
# Taylor J. Smith
####################

# coloured ls
alias ls='ls -hG'

# ls aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lal='ls -al'

# clear aliases
alias claer='clear'
alias clera='clear'
alias cler='clear'
alias clar='clear'

# exit aliases
alias bye='clear;exit'
alias byebye='clear;logout'

# interactive aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# SSH aliases
alias gate='ssh tsmit55@gate.csd.uwo.ca'
alias obelix='ssh tsmit55@obelix.gaul.csd.uwo.ca'
alias obelix-X='ssh -X tsmit55@obelix.gaul.csd.uwo.ca'
alias uwlinux='ssh tj2smith@linux.cs.uwaterloo.ca'
alias uwlinux-X='ssh -X tj2smith@linux.cs.uwaterloo.ca'
alias uwstudent='ssh tj2smith@linux.student.cs.uwaterloo.ca'

# miscellaneous aliases
alias h='history'
alias where='pwd'
alias which='type -a'
alias du='du -kh'
alias df='df -kh'

# extract command
extract () {
	if [ -f $1 ] ; then
		case $1 in
		*.tar.bz2) tar xjf $1    ;;
		*.tar.gz)  tar xzf $1    ;;
		*.bz2)     bunzip2 $1    ;;
		*.rar)     unrar e $1    ;;
		*.gz)      gunzip $1     ;;
		*.tar)     tar xf $1     ;;
		*.tbz2)    tar xjf $1    ;;
		*.tgz)     tar xzf $1    ;;
		*.zip)     unzip $1      ;;
		*.Z)       uncompress $1 ;;
		*.7z)      7z x $1       ;;
		*)         echo "'$1' cannot be extracted with extract" ;;
		esac
	else
		echo "'$1' is not an extractable file"
	fi
}
