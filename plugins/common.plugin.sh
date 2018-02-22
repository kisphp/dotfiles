#!/usr/bin/env bash

mcd () {
    dotfiles_log "Create directory ${1} and get inside it" Common
    if [[ -z "${1}" ]]; then
        errorText "You must specify the directory name"
        return 1
    fi
    if [[ "${1}" == '.' ]];then
        errorText "Cannot create directory with name '.'"
        return 1
    fi
    mkdir "${1}" && cd "${1}"
    writeErrorMessage "Could not create directory ${1}"
}

edit () {
    if [[ "${1}" == "-h" ]]; then
        printf "\n%s:\n" "Usage"
        echo "${0} [directory_name]  -> open phpstorm in specified directory"
        echo "${0} .                 -> open phpstorm in current directory"
        echo " "
        return 1
    elif [[ "${1}" != "" ]]; then
        dotfiles_log "I am in directory $(pwd) and I open in phpstorm: ${1}"
        pstorm "${1}"
        return 0
    else
        dotfiles_log "I am in directory $(pwd) and I open in it phpstorm"
        pstorm .
        return 0
    fi
}
