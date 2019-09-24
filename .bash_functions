####################
# .bash_functions
# Taylor J. Smith
####################

# extract command
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract filename.(zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz)"
        echo "       extract filename1.ext [filename2.ext ...]"
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

# printable man pages command
function manprint {
    if [ $# -lt 1 ]; then
        echo "Usage: manprint command [command2 ...]"
    else
        man -t "$@" | open -f -a "Preview";
    fi
}

# mkdir and cd combination command
function mkdircd {
    if [ $# -ne 1 ]; then
        echo "Usage: mkdircd foldername"
    else
        case "$1" in
            /*) 
                : ;;
            *)
                set -- "./$1" ;;
        esac

        mkdir -p "$1" && cd "$1"
    fi
}

# weather command
# dependency: wttr.in (https://github.com/chubin/wttr.in)
function weather {
    OPTIND=1
    local LOCATION=
    local PARAM=
    local HEADVAL=-7
    local TAILVAL=-5
    while getopts ":cd:hl:" opt; do
        case $opt in
            c)
                PARAM="?format=1"
                ;;
            d)
                case $OPTARG in
                    today)
                        HEADVAL=-17
                        TAILVAL=-10
                        ;;
                    tomorrow)
                        HEADVAL=-27
                        TAILVAL=-10
                        ;;
                    2day)
                        HEADVAL=-27
                        TAILVAL=-20
                        ;;
                    3day)
                        HEADVAL=-37
                        TAILVAL=-30
                        ;;
                esac
                ;;
            h)
                echo "Usage: weather [-c today/tomorrow/2day/3day] [-d] [-h] [-l location]"
                return 0
                ;;
            l)
                LOCATION=$OPTARG 
                ;;
            \?)
                echo "Error: invalid option"
                return 1
                ;;
            :)
                ;;
        esac
    done
    curl -s wttr.in/$LOCATION$PARAM | head $HEADVAL | tail $TAILVAL
}
