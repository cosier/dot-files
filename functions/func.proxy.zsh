#!/bin/zsh


#####################################
# Proxy Management

function dns-server(){
    launchctl unload -w /System/Library/LaunchDaemons/org.isc.named.plist
    launchctl load -w /System/Library/LaunchDaemons/org.isc.named.plist
}

function dns-tunnel-ec2(){
    while [ true ]
    do
        echo "Starting DNS Tunnel"
        dns2tcpc -z ec2.tunnel.vza.ca  -l 3333 -r ssh $@
    done
}
function dns-tunnel(){
    while [ true ]
    do
        echo "Starting DNS Tunnel"
        dns2tcpc -z tunnel.vza.ca  -l 3333 -r ssh $@
    done
}

function dns-proxy(){
    while [ true ]
    do
        echo "Starting SSH Proxy"
        ssh localhost -C -c arcfour -p 3333 -D 8080 $@
    done
}

function proxy(){
    config=/usr/local/etc/polipo.conf
    if [[ "$1" == "edit" ]]; then; vim /usr/local/etc/polipo.conf; return; fi;
    if [[ "$1" == "socks" ]]; then; config=/usr/local/etc/polipo.socks.conf; fi;

    if [[ "$1" == "kill" || "$2" == "kill" ]]; then
        sudo killall polipo
    fi

    echo " Using config: $config";
    mkdir -p /tmp/polipo
    polipo -c $config
}

function proxy-switch(){
    if [[ "$1" == "on" ]]; then
        echo "Proxy: turning on"

        gconftool-2 -t string -s /system/http_proxy/ignore_hosts \
            "[\
                localhost,\
                127.0.0.0/8,\
                *.local, \
                dev.*, \
                *.dev, \
                *.google.com, google.com, \
                *.gmail.com, gmail.com, \
                *.youtube.com, youtube.com, \
                *.shogun.ca
            ]"

        gconftool-2 -t string -s /system/http_proxy/host            "localhost"
        gconftool-2 -t int -s    /system/http_proxy/port            8080
        gconftool-2 -t bool -s   /system/http_proxy/use_http_proxy  true
    else
        echo "Proxy: turning off"
        gconftool-2 -t bool -s /system/http_proxy/use_http_proxy false
    fi;
}
