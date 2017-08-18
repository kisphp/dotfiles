#!/usr/bin/env bash

# Foreground colors
FG_RED="\033[31m"
FG_WHITE="\033[97m"
FG_GREEN="\033[32m"
FG_BLACK="\033[30m"
FG_YELLOW="\033[33m"
FG_BLUE="\033[34m"

# Background colors
BG_RED="\033[41m"
BG_WHITE="\033[107m"
BG_GREEN="\033[42m"
BG_BLACK="\033[40m"
BG_YELLOW="\033[43m"
BG_BLUE="\033[44m"

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if [ -t 1 ] && [ $KP_COLORS -gt 0 ]; then
    ERROR="${BG_RED}${FG_WHITE}"
    SUCCESS="${BG_GREEN}${FG_BLACK}"
    INFO="${BG_YELLOW}${FG_BLACK}"
    LABEL="${BG_BLUE}${FG_WHITE}"
    NC="\033[0m" # reset
else
    ERROR=""
    SUCCESS=""
    INFO=""
    LABEL=""
    NC=""
fi

function labelText {
    log "[Label] ${1}"
    echo -e "\n${LABEL} ${1} ${NC}\n"
}

function errorText {
    log "[Error] ${1}"
    echo -e "\n${ERROR} ${1} ${NC}\n"
}

function infoText {
    log "[Info] ${1}"
    echo "\n${INFO} ${1} ${NC}\n"
}

function successText {
    log "[Success] ${1}"
    echo -e "\n${SUCCESS} ${1} ${NC}\n"
}

function writeErrorMessage {
    if [[ $? != 0 ]]; then
        errorText "Error: ${1}"
        log "[Error] [== Exit ==]"
        exit 1
    fi
}

function _debug_print {
    labelText "this is label text"
    errorText "this is error text"
    infoText "this is info text"
    successText "this is success text"
}
