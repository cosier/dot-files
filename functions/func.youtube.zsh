#!/bin/bash

function youtube(){
    MV_ROOT=~/Movies/YouTube

    case "$1" in
    "bee")
        echo "Downloading Bee's playlist"
        mvdir=$MV_ROOT/bee
        mkdir -p $mvdir
        cd $mvdir
        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3Vpjrwi9SKcBINg-MKbuhlE0zTxh
    ;;

    "jp")
        mvdir=$MV_ROOT/jp
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3VpjrwhGJU0IyxAzbvwUJFVXQjKJ
    ;;

    "klumzy")
        mvdir=$MV_ROOT/klumzy
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3VpjrwjhotvBMu2687itZntYv6-H
    ;;

    "beards")
        mvdir=$MV_ROOT/beards
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3Vpjrwg5T4MzQQvB_RYX2UhxcpEM
    ;;

    "bwda")
        mvdir=$MV_ROOT/bwda
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3Vpjrwg2QsKZnrnM7wT0iMwnosX8
        ;;
    "oldschool")
        mvdir=$MV_ROOT/oldschool
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3VpjrwgjvBVxwQ5m1Y2SPb84WhKk
        ;;

    "chill")
        mvdir=$MV_ROOT/chill
        mkdir -p $mvdir;
        cd $mvdir;

        noglob youtube-dl http://www.youtube.com/playlist?list=PLLsos3VpjrwhSpEyIbFUvH-O3fRhB6mWU
        ;;
    *)
        youtube bwda;
        youtube klumzy;
        youtube chill;
        youtube bee;
        youtube jp;
        youtube beards;
        youtube oldschool;
        ;;
    esac
}
