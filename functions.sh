#!/usr/bin/env bash

ERROR="\033[41m" # background red
GREEN="\033[42m" # background green
INFO="\033[43m" # yellow text
BACKGROUND="\033[46m" # background blue
BLACKTEXT="\033[30m"
COLOR="\033[39m" # text white
NC="\033[0m" # reset

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

function reload_dotfiles {
    infoText "Reloading dotfiles"
    source ./aliases.sh -u
}

function self_update {
    if [[ "$1" != "-u" ]]; then
        CURRENT_DIRECTORY=`pwd`
        cd ~/.dotfiles

        if [[ ! -f ~/.dotfiles/custom.sh ]]; then
            infoText "Write custom.sh file"
            cp ~/.dotfiles/custom.sh.dist ~/.dotfiles/custom.sh
        fi

        git fetch
        CURRENT_COMMIT_HASH=`git rev-parse --verify HEAD`
        REMOTE_COMMIT_HASH=`git rev-parse --verify origin/master`

        if [[ "$CURRENT_COMMIT_HASH" != "$REMOTE_COMMIT_HASH" ]];then
            infoText "Updating Dotfiles repository ..."
            git pull --rebase origin master
        fi

        cd $CURRENT_DIRECTORY
    else
        reload_dotfiles
    fi
}

# run php code fixer
function pfix {
    if [[ -f 'vendor/bin/php-cs-fixer' ]]; then
        php vendor/bin/php-cs-fixer fix -v
    fi

    if [[ -f 'bin/php-cs-fixer' ]]; then
        php bin/php-cs-fixer fix -v
    fi
}

# run codeception
function codecept {
    if [[ -f 'vendor/bin/codecept' ]]; then
        php vendor/bin/codecept $@
    fi

    if [[ -f 'bin/codecept' ]]; then
        php bin/codecept $@
    fi
}

# quick git merge and push
function makeup() {
    GIT=$(which git)
    ADD=1

    while getopts ":n:" opt; do
        case $opt in
            n)
                ADD=0
                ;;
        esac
    done

    if [[ -z "${1}" ]]; then
        echo "You must provide a comment"
        echo "Usage:"
        echo "   ${0} my-comment"
        echo " "
        echo "   or to skip git add"
        echo "   ${0} -n my-comment"
        echo " "

        return 0
    fi

    if [[ "$ADD" == 1 ]];then
        ${GIT} add .
    fi
    ${GIT} commit -m "${@}"
    ${GIT} push
}

# find vagrant installed boxes
function findbox {
    find ~/VirtualBox\ Vms -type f -name '*.vbox'
    find ~/VirtualBox_Vms -type f -name '*.vbox'
}

# find vagrant box location
function vagSrc {
    grep -Hrni 'SharedFolder name="vagrant"' $1
}

function kvm {
    if [[ -z $1 ]]; then
        DIR='_vm'
    else
        DIR=$1
    fi
    git clone https://github.com/kisphp/symfony-vagrant.git $DIR
}
