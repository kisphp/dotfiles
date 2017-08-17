#!/usr/bin/env bash

. kisphp-dotfiles.sh

function main () {
    GIT=`which git`

    if [[ -f "$HOME/.zshrc" ]];then
        ZSH_FILE="$HOME/.zshrc"
        infoText "install on ${ZSH_FILE}"
    else
        ZSH_FILE="$HOME/.bashrc"
        infoText "install on ${ZSH_FILE}"
    fi

    ALIASES_SCRIPT="$DOTFILES/aliases.sh"

    if [[ ! -d "${DOTFILES}" ]];then
        infoText "Cloning Dotfiles..."
        hash git >/dev/null 2>&1 || {
            errorText "Error: git is not installed"
            exit 1
        }

        $GIT clone --depth=1 https://github.com/kisphp/dotfiles.git "${DOTFILES}"
    fi

    if [[ ! `cat ${ZSH_FILE} | grep "${ALIASES_SCRIPT}"` ]]; then
        echo "--register aliases--"
        echo ". ~/${ALIASES_SCRIPT}" >> $ZSH_FILE
    fi

    echo ' '
    echo '-----Installed-----'
    echo ' '
    echo "!!!! Don't forget to run:"
    echo ' '
    echo "source ${ZSH_FILE}"
    echo ' '
}

main
