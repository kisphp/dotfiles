#!/usr/bin/env bash

# restart apache (ubuntu/debian)
apare () {
    dotfiles_log "Restart" "Apache2"
    sudo /etc/init.d/apache2 restart
    writeErrorMessage "Apache2 could not be restarted"
}

# restart nginx
ngre () {
    dotfiles_log "Restart" "Nginx"
    sudo /etc/init.d/nginx restart
    writeErrorMessage "Nginx could not be restarted"
}

# restart mysql
myre () {
    dotfiles_log "Restart" "MySQL"
    sudo /etc/init.d/mysql restart
    writeErrorMessage "MySQL could not be restarted"
}

# restart phpfpm
phpre () {
    if [[ -f '/etc/init.d/php7-fpm' ]]; then
        dotfiles_log "Restart version 7" "FPM"
        sudo /etc/init.d/php7-fpm restart
        writeErrorMessage "PHP 7 FPM could not be restarted"
    fi
    if [[ -f '/etc/init.d/php5-fpm' ]]; then
        dotfiles_log "Restart version 5" "FPM"
        sudo /etc/init.d/php5-fpm restart
        writeErrorMessage "PHP 5 FPM could not be restarted"
    fi
}
