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
