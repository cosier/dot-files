#!/bin/zsh

#####################################
# Daemon Management
function service_edit(){
    if [[ -z "$1" ]]; then
        local editor="vim";
    else
        local editor=$1
    fi

    $editor ~/.dot/services.zsh
    service_update
}

functions service_update(){
    clr_escape "Updating Services" $CLR_CYAN;
    source ~/.dot/services.zsh
}


function service_php(){
        local cmd=$1
        local fpm_pid="/usr/local/var/run/php-fpm.pid"
        local php="/usr/local/sbin/php-fpm"
        local fpm_opts="--fpm-config=/usr/local/etc/php/5.4/php-fpm.conf"
       
        if  [[ "$cmd" = "stop" ]]; then;
            echo "Stopping PHP";
            sudo kill -2 `cat $fpm_pid`;
            return; 
        fi
        
        if [[ -f "$fpm_pid" ]]; then
            clr_escape "Killing Existing PHP-FPM process (graceful)" $CLR_RED;
            sudo kill -2 `cat $fpm_pid`
        fi

        clr_escape "Launching PHP";
        sudo $php -D $fpm_opts
        return;
}
if [[ -n $osx ]]; then
function service(){
    
    name=$1;
    cmd=$2;

    if [[ -z "$cmd" ]]; then
       local cmd="status"    
    fi

    if [[ -z "$name" ]]; then
        echo "Must provide a service name";
        exit 0;
    fi
    
    # Start logic for various types of specific services
    if [[ "$name" = "php" ]]; then
        service_php $cmd;
    fi;

    if [[ "$name" = "nginx" ]]; then
        local ngx="/usr/local/opt/nginx/bin/nginx.sh"
        sudo $ngx 
        return;
    fi

    case "$cmd" in
        "status" )
            sudo launchctl list | grep -i $name
            return;
        ;;
        
        "start" ) 
            clr_escape "Starting: $name" $CLR_CYAN $CLR_BLACKB;
            lctl $name load
        ;;
        
        "stop" )
            clr_escape "Stopping: $name" $CLR_RED $CLR_BLACKB;
            lctl $name unload
        ;;

        "restart" )
            echo "Restarting: $name";
            echo "--------------------"
            service $name stop;
            service $name start;
        ;;
    esac;

}
fi

function lctl(){
    daemon=$1
    loc=$LA
    cmd=$2

    launchctl $cmd $loc/*$daemon*

}
