#!/bin/bash

function check_root(){
    if [[ $USER == "root" ]]; then
        return 0;
    else
        return 1;
    fi
}

function start_network(){
    ip link set enp3s0 up &&
    ip address restore < $HOME/.config/ip/address.config &&
    ip route restore < $HOME/.config/ip/route.config &&
    echo "Network started"
}

check_root && start_network
