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
if [ -t 1 ]; then
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

GIT=$(which git)

# Path to your oh-my-zsh installation.
DOTFILES=$HOME/.dotfiles

ALIASES_SCRIPT="$DOTFILES/kisphp-dotfiles.sh"

function _install () {

    if [[ -f "$HOME/.zshrc" ]];then
        ZSH_FILE="$HOME/.zshrc"
        echo "${INFO}Install on ${ZSH_FILE}${NC}"
    else
        ZSH_FILE="$HOME/.bashrc"
        echo "${INFO}Install on ${ZSH_FILE}${NC}"
    fi

    if [[ ! -d "${DOTFILES}" ]];then
        echo "${INFO}Cloning Dotfiles...${NC}"
        hash git >/dev/null 2>&1 || {
            echo "${ERROR}Error: git is not installed${NC}"
            exit 1
        }

        $GIT clone --depth=1 https://github.com/kisphp/dotfiles.git "${DOTFILES}"
    fi

    if [[ ! $(cat ${ZSH_FILE} | grep "${ALIASES_SCRIPT}") ]]; then
        echo "--register aliases--"
        echo ". ${ALIASES_SCRIPT}" >> $ZSH_FILE
    fi

    echo "${FG_GREEN}"
    echo '-----Installed-----'
    echo ' '
    echo "!!!! Don't forget to run:"
    echo ' '
    echo "source ${ZSH_FILE}"
    echo "${NC}"
}

_install
