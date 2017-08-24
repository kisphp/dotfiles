#!/usr/bin/env bash

# start vagrant box and connect
function vagon {
    dotfiles_log "vagrant up && vagrant ssh: ${PWD}" "Vagrant"
    vagrant up && vagrant ssh
}

# suspend a vagrant box
function vagof {
    dotfiles_log "suspend VM: ${PWD}" "Vagrant"
    vagrant suspend
}

# suspend a vagrant box and close terminal window/tab
function vagoff {
    dotfiles_log "suspend VM and exit: ${PWD}" "Vagrant"
    vagrant suspend && exit
}

# destroy vagrant box
function vagkill {
    dotfiles_log "Destroy VM ${PWD}" "Vagrant"
    vagrant destroy
}

# destory vagrant box alias
alias vagkil='vagkill'

# find vagrant installed boxes
function findbox {
    if [[ -d "${HOME}/VirtualBox Vms" ]]; then
        dotfiles_log "Search: ${HOME}/VirtualBox\ Vms" "VirtualBox img search"
        find "${HOME}/VirtualBox Vms" -type f -name '*.vbox'
    fi
    if [[ -d "${HOME}/VirtualBox_Vms" ]]; then
        dotfiles_log "Search: ${HOME}/VirtualBox_Vms" "VirtualBox img search"
        find $HOME/VirtualBox_Vms -type f -name '*.vbox'
    fi
}

# find vagrant box location
function vagSrc {
    grep -Hrni 'SharedFolder name="vagrant"' $1
}

# download kisphp virtual machine for single symfony project
function kvm {
    if [[ -z $1 ]]; then
        DIR='_vm'
    else
        DIR=$1
    fi
    dotfiles_log "cloned KVM into ${DIR}" Git
    cln "kisphp/symfony-vagrant" "${DIR}"
}
