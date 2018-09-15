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
alias innovate='ssh tsmith@innovate.cs.queensu.ca'
alias torus='ssh tsmith@torus.cs.queensu.ca'

# software aliases
alias maple='/Library/Frameworks/Maple.framework/Versions/2016/bin/maple'

# miscellaneous aliases
alias h='history'
alias where='pwd'
alias which='type -a'
alias du='du -kh'
alias df='df -kh'

# extract command
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract filename.(zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz)"
        echo "       extract filename1.ext filename2.ext filename3.ext"
    else
        for n in $@
        do
            if [ -f "$n" ]; then
                case "${n%,}" in
                    *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                        tar xvf "$n"            ;;
                    *.lzma)
                        unlzma ./"$n"           ;;
                    *.bz2)
                        bunzip2 ./"$n"          ;;
                    *.rar)
                        unrar x -ad ./"$n"      ;;
                    *.gz)
                        gunzip ./"$n"           ;;
                    *.zip)
                        unzip ./"$n"            ;;
                    *.z)
                        uncompress ./"$n"       ;;
                    *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                        7z x ./"$n"             ;;
                    *.xz)
                        unxz ./"$n"             ;;
                    *.exe)
                        cabextract ./"$n"       ;;
                    *)
                        echo "Error: unknown archive method for '$n'"
                        return 1
                        ;;
                esac
            else
                echo "Error: '$n' does not exist"
                return 1
            fi
        done
    fi
}
