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

# find vagrant installed boxes
function findbox {
    find ~/VirtualBox\ Vms -type f -name '*.vbox'
}

# find vagrant box location
function vagSrc {
    grep -Hrni 'SharedFolder name="vagrant"' $1
}

# start vagrant box and connect
alias vagon='vagrant up && vagrant ssh'

# suspend a vagrant box
alias vagof='vagrant suspend'

# suspend a vagrant box and close terminal window/tab
alias vagoff='vagrant suspend && exit'

# restart apache (ubuntu/debian)
alias apare='sudo /etc/init.d/apache2 restart'

# restart nginx
alias ngre='sudo /etc/init.d/nginx restart'

# restart mysql
alias myre='sudo /etc/init.d/mysql restart'
