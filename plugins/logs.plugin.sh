#!/usr/bin/env bash

showlogs () {
    PATH="$1"
    if [[ -z "${PATH}" ]];then
        PATH='/var/log'
    fi

    tail -f $(find "${PATH}" -type f -name '*.log')
}
