#!/bin/zsh

function kp(){
    target=$1;
    ps aux | grep $target | awk '{print $2}'

    pids=$(ps aux | grep $target | awk '{print $2}')
    echo $pids;
    read -p "Are you sure? " -n 1 -r
    for p in $pids
    do
        echo "Killing: $p";
        sudo kill $p
    done
}



