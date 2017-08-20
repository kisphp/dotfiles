#!/usr/bin/env bash

# restart apache (ubuntu/debian)
function apare {
    dotfiles_log "Restart" "Apache2"
    sudo /etc/init.d/apache2 restart
}

# restart nginx
function ngre {
    dotfiles_log "Restart" "Nginx"
    sudo /etc/init.d/nginx restart
}

# restart mysql
function myre {
    dotfiles_log "Restart" "MySQL"
    sudo /etc/init.d/mysql restart
}

# restart phpfpm
function phpre {
    if [[ -f '/etc/init.d/php7-fpm' ]]; then
        dotfiles_log "Restart version 7" "FPM"
        sudo /etc/init.d/php7-fpm restart
    fi
    if [[ -f '/etc/init.d/php5-fpm' ]]; then
        dotfiles_log "Restart version 5" "FPM"
        sudo /etc/init.d/php5-fpm restart
    fi
}
