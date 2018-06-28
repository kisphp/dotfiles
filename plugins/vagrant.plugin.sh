#!/usr/bin/env bash

# destory vagrant box alias
alias vsh='vagrant ssh'
alias vup='vagrant up'
alias vst='vagrant status'
alias von='vagon'

# start vagrant box and connect
vagon () {
    dotfiles_log "vagrant up && vagrant ssh: ${PWD}" "Vagrant"
    vagrant up $@ && vagrant ssh
}

# suspend a vagrant box
vagof () {
    dotfiles_log "suspend VM: ${PWD}" "Vagrant"
    vagrant suspend
}

# suspend a vagrant box and close terminal window/tab
vagoff () {
    dotfiles_log "suspend VM and exit: ${PWD}" "Vagrant"
    vagrant suspend $@ && exit
}

vagkil () {
    dotfiles_log "Destroy VM ${PWD}" "Vagrant"
    vagrant destroy $@
}

# destroy vagrant box
vagkill () {
    vagkil $@
    exit
}

# find vagrant installed boxes
listbox () {
    vagrant global-status
}

alias vstg='listbox'

vstopr () {
    if [[ "${1}" == "-l" ]]; then
        listbox | grep running

        return 0
    fi

    listbox | grep running | awk '{print $1}' | xargs vagrant suspend

    return 0
}

# download kisphp virtual machine for single symfony project
kvm () {
    if [[ -z $1 ]]; then
        DIR='_vm'
    else
        DIR=$1
    fi
    dotfiles_log "cloned KVM into ${DIR}" "Git"
    cln "kisphp/symfony-vagrant" "${DIR}"
}
