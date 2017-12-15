#!/usr/bin/env bash

showlogs () {
    PATH="$1"
    if [[ -z "${PATH}" ]];then
        PATH='/var/log'
    fi

    TAIL=$(which tail)
    FIND=$(which find)

    $TAIL -f $($FIND "${PATH}" -type f -name '*.log')
}
