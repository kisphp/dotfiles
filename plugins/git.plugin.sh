#!/usr/bin/env bash

# quick git merge and push
function makeup() {
    GIT=$(which git)
    ADD=1

    if [[ -z "${1}" ]]; then
        echo "You must provide a comment"
        echo "Usage:"
        echo "   ${0} my-comment"
        echo " "
        echo "   or to skip git add"
        echo "   ${0} -n my-comment"
        echo " "

        return 0
    fi

    while getopts ":n" opt; do
        case $opt in
            n)
                ADD=0
                # unset $1 variable
                shift
                ;;
        esac
    done

    if [[ "$ADD" == 1 ]];then
        ${GIT} add .
    fi
    ${GIT} commit -m "${*}"
    ${GIT} push
}

