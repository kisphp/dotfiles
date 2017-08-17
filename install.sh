#!/usr/bin/env bash

ERROR="\033[41m" # background red
GREEN="\033[42m" # background green
INFO="\033[43m" # yellow text
BACKGROUND="\033[46m" # background blue
BLACKTEXT="\033[30m"
COLOR="\033[39m" # text white
NC="\033[0m" # reset

GIT=`which git`

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

    if [[ ! `cat ${ZSH_FILE} | grep "${ALIASES_SCRIPT}"` ]]; then
        echo "--register aliases--"
        echo ". ~/${ALIASES_SCRIPT}" >> $ZSH_FILE
    fi

    echo "${GREEN}"
    echo '-----Installed-----'
    echo ' '
    echo "!!!! Don't forget to run:"
    echo ' '
    echo "source ${ZSH_FILE}"
    echo "${NC}"
}

_install
