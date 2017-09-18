#!/usr/bin/env bash

# Foreground colors
export FG_RED="\033[31m"
export FG_WHITE="\033[97m"
export FG_GREEN="\033[32m"
export FG_BLACK="\033[30m"
export FG_YELLOW="\033[33m"
export FG_BLUE="\033[34m"

# Background colors
export BG_RED="\033[41m"
export BG_WHITE="\033[107m"
export BG_GREEN="\033[42m"
export BG_BLACK="\033[40m"
export BG_YELLOW="\033[43m"
export BG_BLUE="\033[44m"

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if [[ -t 1 ]] && [[ $KP_COLORS -gt 0 ]]; then
    export ERROR="${BG_RED}${FG_WHITE}"
    export SUCCESS="${BG_GREEN}${FG_BLACK}"
    export INFO="${BG_YELLOW}${FG_BLACK}"
    export LABEL="${BG_BLUE}${FG_WHITE}"
    export NC="\033[0m" # reset
else
    export ERROR=""
    export SUCCESS=""
    export INFO=""
    export LABEL=""
    export NC=""
fi

labelText () {
    dotfiles_log "${1}" "Label"
    echo -e "${LABEL} ${1} ${NC}"
}

errorText () {
    dotfiles_log "${1}" "Error"
    echo -e "${ERROR} ${1} ${NC}"
}

infoText () {
    dotfiles_log "${1}" "Info"
    echo -e "${INFO} ${1} ${NC}"
}

successText () {
    dotfiles_log "${1}" "Success"
    echo -e "${SUCCESS} ${1} ${NC}"
}

writeErrorMessage () {
    if [[ $? != 0 ]]; then
        errorText "Error: ${1}"
        dotfiles_log "[Error] [== Exit ==]"
        return 1
    fi

    return 0
}

# this is only for debug print messages only
_debug_print () {
    labelText "this is label text"
    errorText "this is error text"
    infoText "this is info text"
    successText "this is success text"
}
