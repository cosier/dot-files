#!/bin/zsh

function volume_down(){
    sudo osascript -e "set Volume 0"
}

function volume_up(){
    sudo osascript -e "set Volume 10"
}
function volume(){
        while getopts "du" opt; do
            case $opt in
                d)
                    volume_down $1
                ;;
                u)
                    volume_up $1
                ;;
            esac;
        done
}


