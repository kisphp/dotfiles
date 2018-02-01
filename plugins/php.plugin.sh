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
    RESULT=$(grep "${1}" < .gitignore | wc -l)

    if [[ "${RESULT}" -eq 0 ]]; then
        labelText "Add ${1} to ignore list"
        gign "${1}"
    fi

    return 0
}

php_new_dir () {
    if [[ ! -d "${1}" ]]; then
        echo "Create ${1} directory"
        mkdir -p "${1}"
    else
        infoText "${1} directory already exists. ignoring"
    fi

    return 0
}

safe_copy_file () {
    if [[ ! -f "${2}" ]]; then
        echo "Copy ${1} file"
        cp "${1}" "${2}"
    else
        infoText "File ${1} already exists. Ignoring"
    fi
}

php_project () {
    labelText "Create necessary directories"
    php_new_dir "./src"
    php_new_dir "./tests/Demo"
    php_new_dir "./web"

    labelText "Copy files"
    safe_copy_file ~/.dotfiles/templates/index.php ./web/index.php
    safe_copy_file ~/.dotfiles/templates/DemoTest.php ./tests/Demo/DemoTest.php
    safe_copy_file ~/.dotfiles/templates/phpunit.xml.dist ./phpunit.xml.dist
    safe_copy_file ~/.dotfiles/templates/composer.json ./composer.json
    safe_copy_file ~/.dotfiles/templates/.gitignore ./.gitignore
}
