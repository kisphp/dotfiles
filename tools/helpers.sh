#!/usr/bin/env bash

# this function is used to display the content from manual md file with same name as called function
function show_manual {
    file="${DOTFILES}/docs/${1}.md"

    if [[ "${2}" == "--help" ]] && [[ -f $file ]];then
        dotfiles_log "show manual" "${1}"
        cat $file

        return 0
    fi

    return 1
}

function read_file_content {
    while read -r line
    do
        echo -e "${line}"
    done < "${1}"
}
