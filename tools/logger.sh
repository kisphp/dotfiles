#!/usr/bin/env bash

function dotfiles_log {
    if [[ "${KP_LOGS}" -gt 0 ]];then
        message=$1
        label=$2
        if [[ -z "${label}" ]];then
            label='Info'
        fi
        now=`date +%Y-%m-%d\ %H:%M:%S`
        echo "${now} [${label}] ${message}" >> "${DOTFILES}/logs/cmd.log"
    fi
}
