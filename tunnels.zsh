#!/bin/zsh

function tunnel(){

    local port_dest=$1
    local port_local=$2
    local target="bailey@vza.shogun.ca"

    
    ssh -v -R ${port_dest}:localhost:${port_local} $target 
}














