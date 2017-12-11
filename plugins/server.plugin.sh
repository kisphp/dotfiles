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
    if [[ $(uname) != "Linux" ]]; then
        errorText "This command must be executed only on linux machines"

        return 0
    fi
    if [[ -f '/etc/init.d/php7.1-fpm' ]]; then
        dotfiles_log "Restart version 7.1" "FPM"
        sudo /etc/init.d/php7.1-fpm restart
        writeErrorMessage "PHP 7.1 FPM could not be restarted"

        return 0
    fi
    if [[ -f '/etc/init.d/php7.0-fpm' ]]; then
        dotfiles_log "Restart version 7.0" "FPM"
        sudo /etc/init.d/php7.0-fpm restart
        writeErrorMessage "PHP 7.0 FPM could not be restarted"

        return 0
    fi
    if [[ -f '/etc/init.d/php7-fpm' ]]; then
        dotfiles_log "Restart version 7" "FPM"
        sudo /etc/init.d/php7-fpm restart
        writeErrorMessage "PHP 7 FPM could not be restarted"

        return 0
    fi
    if [[ -f '/etc/init.d/php5.6-fpm' ]]; then
        dotfiles_log "Restart version 5" "FPM"
        sudo /etc/init.d/php5.6-fpm restart
        writeErrorMessage "PHP 5.6 FPM could not be restarted"

        return 0
    fi
    if [[ -f '/etc/init.d/php5-fpm' ]]; then
        dotfiles_log "Restart version 5" "FPM"
        sudo /etc/init.d/php5-fpm restart
        writeErrorMessage "PHP 5 FPM could not be restarted"

        return 0
    fi

    errorText "No php executable found"
}
