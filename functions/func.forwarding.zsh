#!/bin/zsh


function ipforward(){
        sudo sysctl -w net.inet.ip.fw.enable=1
        sudo sysctl -w net.inet.ip.forwarding=1
        sudo natd -interface en1
        sudo ipfw flush
        sudo ipfw add divert natd all from any to any via en0
        sudo ipfw add divert natd all from any to any via en1
        sudo ipfw add 65535 allow all from any to any
}
