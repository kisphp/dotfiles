#!/usr/bin/env bash

allow_ssh_auth () {
    dotfiles_log "Register SSH key to server: ${*}" "SSH"
    $(which ssh-copy-id) -i "${HOME}/.ssh/id_rsa" $*
    writeErrorMessage "Could not register SSH key on remote server ${*}"
}
