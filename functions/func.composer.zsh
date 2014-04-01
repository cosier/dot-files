#!/bin/zsh

function composer() {
    local GITROOT="$(git rev-parse --show-toplevel)";
    if [[ -f $GITROOT/composer.phar ]]; then
        php $GITROOT/composer.phar $@
    else
        composer
    fi

}

