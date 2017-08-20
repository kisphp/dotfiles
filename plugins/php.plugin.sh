#!/usr/bin/env bash

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

function debug {
    show_manual debug $1 && return 0

    while getopts ":h:n:" opt; do
        case $opt in
            h)
                debug_host=${OPTARG}
                dotfiles_log "set debug_host = ${debug_host}" debug
                ;;
            n)
                debug_name=${OPTARG}
                dotfiles_log "set debug_name = ${debug_name}" debug
                ;;
        esac
    done

    if [ -z "${debug_name}" ];then
        debug_name='localhost'
        dotfiles_log "set debug_name = ${debug_name}" debug
    fi
    if [ -z "${debug_host}" ];then
        debug_host='0.0.0.0'
        dotfiles_log "set debug_host = ${debug_host}" debug
    fi

    XDEBUG_CONFIG="remote_host=${debug_host}"
    PHP_IDE_CONFIG="serverName=${debug_name}"
}
