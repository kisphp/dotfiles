#!/usr/bin/env bash

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if [ -t 1 ]; then
    ERROR="\033[41m" # background red
    GREEN="\033[42m" # background green
    INFO="\033[43m" # yellow text
    BACKGROUND="\033[46m" # background blue
    BLACKTEXT="\033[30m"
    COLOR="\033[39m" # text white
    NC="\033[0m" # reset
else
    ERROR=""
    GREEN=""
    INFO=""
    BACKGROUND=""
    BLACKTEXT=""
    COLOR=""
    NC=""
fi

function labelText {
    echo -e "\n${BACKGROUND}${BLACKTEXT} ${1} ${NC}\n"
}

function errorText {
    echo -e "\n${ERROR}${COLOR} ${1} ${NC}\n"
}

function infoText {
    echo -e "\n${INFO}${BLACKTEXT} ${1} ${NC}\n"
}

function successText {
    echo -e "\n${GREEN}${BLACKTEXT} ${1} ${NC}\n"
}

function writeErrorMessage {
    if [[ $? != 0 ]]; then
        errorText "Error: ${1}"
        exit 1
    fi
}
