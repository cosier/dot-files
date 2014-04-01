#!/bin/zsh

function xmod(){
    if [[ "$1" == "up" ]]; then
        echo "Sourcing ~/.Xmodmap";
        if [[ -z "~/.Xmodmap" ]]; then
            source ~/.Xmodmap;
        fi
    else
        echo "No Option provided";
    fi

}

function mspeed(){
    if [[ -n "$1" ]]; then
        defaults write -g com.apple.mouse.scaling -float $1
    else
        defaults read -g com.apple.mouse.scaling
    fi
}


