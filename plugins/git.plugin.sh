#!/usr/bin/env bash

GIT=$(which git)

# quick git merge and push
makeup () {
    show_manual makeup $1 && return 0

    if [[ "${1}" == "-h" ]];then
        makeup --help
        return 0
    fi

    ADD_FILES_TO_GIT=1

    if [[ -z "${1}" ]]; then
        dotfiles_log "makeup without parameters" Error
        echo "${FG_RED}You must provide a comment${NC}"
        echo "${FG_YELLOW}Usage:"
        echo "   ${0} my-comment"
        echo " "
        echo "   or to skip git add"
        echo "   ${0} -n my-comment"
        echo "${NC}"

        return 0
    fi

    while getopts ":n" opt; do
        case $opt in
            n)
                ADD_FILES_TO_GIT=0
                # unset $1 variable
                shift
                ;;
        esac
    done

    if [[ "${ADD_FILES_TO_GIT}" == 1 ]];then
        ${GIT} add .
    fi
    ${GIT} commit -m "${*}"
    ${GIT} push
    dotfiles_log "committed message '${*}' and pushed" "Git"
}

gign () {
    dotfiles_log "Add file '${1}' to gitignore" "Git"
    echo "${1}" >> .gitignore
}

edited () {
    BRANCH='master'

    while getopts ":b:" opt; do
        case $opt in
            b)
                shift
                if [[ "${1}" != "" ]];then
                    BRANCH="${1}"
                fi
                ;;
        esac
    done

    files="$(${GIT} diff --name-only origin/${BRANCH})"

    for file in $files;
    do
        echo $file
    done
}

alias ged='edited'

cln () {
    show_manual cln $1 && return 0
    REPOSITORY=$1
    shift

    dotfiles_log "Cloned ${REPOSITORY} $*" "Git"

    $GIT clone "https://github.com/${REPOSITORY}.git" "$*"
    writeErrorMessage "Could not clone repository ${REPOSITORY}"
}

# Cancel last commit message
uncommit () {
    dotfiles_log "Cancel last commit" "Git"
    $GIT reset --soft HEAD^
}

alias clean_repo='git_clean_repo'

git_clean_repo () {
    dotfiles_log "Start repo cleanup" "Git clean"
    $GIT checkout master &> /dev/null

    dotfiles_log "Run fetch" "Git clean"
    # Make sure we're working with the most up-to-date version of master.
    $GIT fetch

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    dotfiles_log "Prune obsolete tracking branches" "Git clean"
    $GIT remote prune origin

    # List all the branches that have been merged fully into master, and
    # then delete them. We use the remote master here, just in case our
    # local master is out of date.
    dotfiles_log "Remove all branches that were merged" "Git clean"
    for br in $($GIT branch --merged origin/master | grep -v 'master$'); do
        dotfiles_log "Deleted branch: ${br} from ${PWD}" "Git clean"
        $GIT branch -D "${br}"
    done

    # Now the same, but including remote branches.
    dotfiles_log "List all branches that were merged + remote" "Git clean"
    MERGED_ON_REMOTE=$($GIT branch -r --merged origin/master | sed 's/ *origin\///' | grep -v 'master$')

    if [ "$MERGED_ON_REMOTE" ]; then
        infoText "The following remote branches are fully merged and will be removed: ${MERGED_ON_REMOTE}"

        echo "Continue (y/N)? "
        read REPLY
        if [[ "$REPLY" == Y* ]] || [[ "$REPLY" == y* ]]; then
            git branch -r --merged origin/master | sed 's/ *origin\///' \
                | grep -v 'master$' | xargs -I% git push origin :% 2>&1 \
                | grep --colour=never 'deleted'
            successText "Remove branches were successfully deleted: ${MERGED_ON_REMOTE}"
        fi
    fi
}

mergefile () {
    FILE_1="${1}"
    FILE_2="${2}"

    if [[ -z $FILE_1 ]];then
        errorText "Source file not provided"
        return 1
    fi
    if [[ -z $FILE_2 ]];then
        errorText "Target file not provided"
        return 1
    fi

    # create backup file
    cp "${FILE_1}" "${FILE_1}.bkp"

    # create temporary file
    echo '' > "${FILE_1}.merged"
    # do the merge
    $GIT merge-file -p --union "${FILE_1}" "${FILE_1}.merged" "${FILE_2}" > "${FILE_1}.merged"
    # copy merge result to first file
    cp "${FILE_1}.merged" "${FILE_1}"
    # remove merge result file
    rm "${FILE_1}.merged"

    return 0
}
