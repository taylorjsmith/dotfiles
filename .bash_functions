####################
# .bash_functions
# Taylor J. Smith
####################

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
