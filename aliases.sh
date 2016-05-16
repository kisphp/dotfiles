#!/bin/bash

alias p2='python2'
alias p3='python3'

pfix {
    if [[ -f 'vendor/bin/php-cs-fixer' ]]; then
        php vendor/bin/php-cs-fixer fix -v
    fi

    if [[ -f 'bin/php-cs-fixer' ]]; then
        php bin/php-cs-fixer fix -v
    fi
}

function findbox {
    find ~/VirtualBox\ Vms -type f -name '*.vbox'
}

function vagSrc {
    grep -Hrni 'SharedFolder name="vagrant"' $1
}

alias vagon='vagrant up && vagrant ssh'
alias vagof='vagrant suspend'
alias vagoff='vagrant suspend && exit'
