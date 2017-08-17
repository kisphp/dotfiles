#!/usr/bin/env bash

function log {
    if [ "${KP_LOGS}" -gt 0 ];then
        echo $* >> "${DOTFILES}/logs/cmd.log"
    fi
}
