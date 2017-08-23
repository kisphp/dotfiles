#!/usr/bin/env bash

function allow_ssh_auth {
    dotfiles_log "Register SSH key to server: ${1}" "SSH"
    $(which ssh-copy-id) -i "${HOME}/.ssh/id_rsa.pub" "${1}"
}
