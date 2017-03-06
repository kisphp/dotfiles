#!/bin/bash

alias p2='python2'
alias p3='python3'

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

function autoUpdate {
    CURRENT_DIRECTORY=`pwd`
    cd ~/.dotfiles
    if [[ ! -f "custom.sh" ]]; then
        cp custom.sh.dist custom.sh
    fi
    CURRENT_COMMIT_HASH=`git rev-parse --verify HEAD`
    REMOTE_COMMIT_HASH=`git rev-parse --verify origin/master`

    if [[ "$CURRENT_COMMIT_HASH" != "$REMOTE_COMMIT_HASH" ]];then
        git pull
    fi
    cd $CURRENT_DIRECTORY
}

autoUpdate

# start vagrant box and connect
alias vagon='vagrant up && vagrant ssh'

# suspend a vagrant box
alias vagof='vagrant suspend'

# suspend a vagrant box and close terminal window/tab
alias vagoff='vagrant suspend && exit'

# destroy vagrant box
alias vagkill='vagrant destroy'

# destory vagrant box alias
alias vagkil='vagkill'

# restart apache (ubuntu/debian)
alias apare='sudo /etc/init.d/apache2 restart'

# restart nginx
alias ngre='sudo /etc/init.d/nginx restart'

# restart mysql
alias myre='sudo /etc/init.d/mysql restart'

. ~/.dotfiles/custom.sh
