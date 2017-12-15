#!/usr/bin/env bash

banip () {
    IP="$1"

    if [[ -z "${IP}" ]]; then
        errorText "ip is empty"

        return 1
    fi

    IPTABLES=$(which iptables)

    $IPTABLES -A INPUT -s "${IP}" -j LOG --log-prefix "Banned IP "
    $IPTABLES -A INPUT -s "${IP}" -j DROP

    return 0
}
