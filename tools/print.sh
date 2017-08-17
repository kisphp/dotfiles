#!/usr/bin/env bash

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
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

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e

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
        errorText "${1}"
        exit 1
    fi
}
