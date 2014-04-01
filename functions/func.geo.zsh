#!/bin/zsh

#####################################
# GEOIP helpers
function geo(){
    geoiplookup -f /usr/local/Cellar/geoip/1.5.1/share/GeoIP/GeoIP.dat $1
}

