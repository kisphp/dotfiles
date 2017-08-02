#!/bin/bash

. ~/.dotfiles/functions.sh

alias p2='python2'
alias p3='python3'

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

if [[ "$1" != "-u" ]]; then
    self_update
fi

. ~/.dotfiles/custom.sh
