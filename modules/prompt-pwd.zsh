#
# Prompt setup function commonly used by prompt themes.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   ArLE <ARLEQUIN.prx@gmail.com>
#

function prompt-pwd {
    setopt localoptions extendedglob

    local current_pwd="${PWD/#$HOME/~}"
    local ret_directory

    if [[ "$current_pwd" == (#m)[/~] ]]; then
        ret_directory="$MATCH"
        unset MATCH
    elif zstyle -m ':klr:module:prompt' pwd-length 'full'; then
        ret_directory=${PWD}
    elif zstyle -m ':klr:module:prompt' pwd-length 'long'; then
        ret_directory=${current_pwd}
    else
        ret_directory="${${${${(@j:/:M)${(@s:/:)current_pwd}##.#?}:h}%/}//\%/%%}/${${current_pwd:t}//\%/%%}"
    fi

    unset current_pwd

    print "$ret_directory"

}

