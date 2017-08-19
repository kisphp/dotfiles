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

    echo "-enter function-"

    show_manual debug $1 && return 0

    while getopts ":h:n:" opt; do
        case $opt in
            h)
                debug_host=${OPTARG}
                echo "set debug_host = ${debug_host}"
                ;;
            n)
                debug_name=${OPTARG}
                echo "set debug_name = ${debug_name}"
                ;;
        esac
    done

    if [ -z "${debug_name}" ];then
        debug_name='localhost'
        echo "set debug_name = ${debug_name}"
    fi
    if [ -z "${debug_host}" ];then
        debug_host='0.0.0.0'
        echo "set debug_host = ${debug_host}"
    fi

    XDEBUG_CONFIG="remote_host=${debug_host}"
    PHP_IDE_CONFIG="serverName=${debug_name}"

    echo $XDEBUG_CONFIG
    echo $PHP_IDE_CONFIG

    echo "-exit function-"
}
