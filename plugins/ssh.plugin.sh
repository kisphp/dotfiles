#!/usr/bin/env bash

allow_ssh_auth () {
    if [[ -z "$1" ]]; then
        errorText "Please provide user@server_address"
        echo "Usage:"
        echo ""
        echo "$0 user@server.com"
        echo ""

        return 1
    fi

    dotfiles_log "Register SSH key to server: ${*}" "SSH"
    $(which ssh-copy-id) -i "${HOME}/.ssh/id_rsa" $*
    writeErrorMessage "Could not register SSH key on remote server ${*}"

    return 0
}
