#!/bin/zsh


function func-create(){
    vim ~/.dot/functions/func.$1.zsh
    source ~/.dot/functions/func.$1.zsh
}

function func-refresh() {
    FUNCS=$(ls ~/.dot/functions)
    buffer=(${=FUNCS})

    for f in $buffer
    do
        if [[ $f == func.* ]]; then
            file=~/.dot/functions/$f
            # echo "Sourcing: $file"
            source $file
        fi
    done

}

function func(){
    vim ~/.dot/functions/func.$1.zsh
    source ~/.dot/functions/func.$1.zsh
}

function func-list(){
    ls -l ~/.dot/functions
}

function airport_3bb(){
    airport --associate='@ 3BB_WiFi' --bssid='28:10:7b:de:15:cc'
}

function beeg(){
    wget -c http://0.video.mystreamservice.com/480p/$1.mp4
}

# GO!
func-refresh

function conf(){

    local thing=$1
    local editor=/usr/local/bin/subl
    local dir=""

    if [[ -z $thing ]]; then
        clr_escape "Must provide a thing" $CLR_CYAN
        return;
    fi

    if [[ "$thing" = "php" ]]; then
        clr_escape "Editing PHP 5.5 configuration" $CLR_BOLD $CLR_BLACKB $CLR_YELLOW
        $editor "/usr/local/etc/php/"
        return;
    fi

    if [[ "$thing" = "nginx" ]]; then
        clr_escape "Editing NGINX configuration" $CLR_BOLD $CLR_BLACKB $CLR_YELLOW
        $editor /usr/local/etc/openresty/nginx.conf
        return;
    fi

    if [[ "$thing" = "launch" ]]; then
        clr_escape "Editing LaunchDaemon configuration" $CLR_BOLD $CLR_BLACKB $CLR_YELLOW
        $editor $LA
        return;
    fi


    if [[ $dir = "" ]]; then
        clr_escape "Your $thing has been lost to the void..." $CLR_RED
    else
        clr_escape "$editor: $dir" $CLR_BOLD $CLR_BLACKB $CLR_YELLOW
        $editor $dir
    fi

}




