#!/usr/bin/env bash

function show_manual {
    file="${DOTFILES}/docs/${1}.md"

    if [[ "${2}" == "--help" ]] && [[ -f $file ]];then
        log "show manual" "${1}"
        cat $file

        return 0
    fi

    return 1
}
