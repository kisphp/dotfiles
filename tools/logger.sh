#!/usr/bin/env bash

function log {
    if [[ "${KP_LOGS}" -gt 0 ]];then
        message=$1
        label=$2
        if [[ -z "${label}" ]];then
            label='Info'
        fi
        echo "[${label}] ${message}" >> "${DOTFILES}/logs/cmd.log"
    fi
}
