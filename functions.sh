#!/usr/bin/env bash

. ~/.dotfiles/print.sh

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

    while getopts ":n" opt; do
        case $opt in
            n)
                ADD=0
                # unset $1 variable
                shift
                ;;
        esac
    done

    if [[ "$ADD" == 1 ]];then
        ${GIT} add .
    fi
    ${GIT} commit -m "'${@}'"
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
