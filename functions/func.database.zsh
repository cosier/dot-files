#!/bin/zsh


function dbase(){

    GITROOT="$(git rev-parse --show-toplevel)";

    if [[ -f "$GITROOT/bin/database" ]]; then
        local cmd="$GITROOT/bin/database.sh"
    else
        local cmd="$GITROOT/bin/database.sh"
    fi
    
    $cmd $@

}

function pg_stop(){
    pg_ctl -D /usr/local/var/postgres stop
}

function pg_start(){
    pg_ctl -D /usr/local/var/postgres start
}
