#!/bin/zsh

function volume_down(){
    # sudo osascript -e "set Volume 0"
    amixer -D pulse sset Master 5%-
}

function volume_up(){
    # sudo osascript -e "set Volume 10"
    amixer -D pulse sset Master 5%+
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


