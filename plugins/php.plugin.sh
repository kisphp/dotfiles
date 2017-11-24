#!/usr/bin/env bash

# run php code fixer
pfix () {
    if [[ -f 'vendor/bin/php-cs-fixer' ]]; then
        php vendor/bin/php-cs-fixer fix -v
    fi

    if [[ -f 'bin/php-cs-fixer' ]]; then
        php bin/php-cs-fixer fix -v
    fi
}

# run codeception
codecept () {
    if [[ -f 'vendor/bin/codecept' ]]; then
        php vendor/bin/codecept $@
    fi

    if [[ -f 'bin/codecept' ]]; then
        php bin/codecept $@
    fi
}

debug () {
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

    export XDEBUG_CONFIG="remote_host=${debug_host}"
    export PHP_IDE_CONFIG="serverName=${debug_name}"
}

php_git_ignore_element () {
    RESULT=$(cat .gitignore | grep "${1}" | wc -l)

    if [[ "${RESULT}" -eq 0 ]]; then
        labelText "Add ${1} to ignore list"
        gign "${1}"
    fi

    return 0
}

php_new_dir () {
    if [[ ! -d "${1}" ]]; then
        labelText "Create ${1} directory"
        mkdir "${1}"
    else
        infoText "${1} directory already exists. ignoring"
    fi

    return 0
}

php_project () {
    php_new_dir "./src"
    php_new_dir "./tests"

    if [[ ! -f './composer.json' ]]; then
        labelText "Generate composer.json file"
        cp ~/.dotfiles/templates/composer.json ./composer.json
    else
        infoText "composer.json already exists. ignoring"
    fi
    if [[ ! -f './.gitignore' ]]; then
        touch .gitignore
    fi

    php_git_ignore_element "vendor/"
    php_git_ignore_element ".idea/"
}
