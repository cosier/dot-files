#!/bin/zsh

function kp(){
    target=$1;
    ps aux | grep $target | awk '{print $2}'

    pids=$(ps aux | grep $target | awk '{print $2}')
    echo $pids;

    for p in $pids
    do
        echo "Killing: $p";
        sudo kill $p
    done
}

