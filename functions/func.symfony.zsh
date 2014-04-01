#!/bin/zsh

#####################################
# Symfony2 Helpers

function tests(){
    GITROOT="$(git rev-parse --show-toplevel)"; cd $GITROOT;
    bin/tests.sh $@
}

function entity(){
    console doctrine:generate:entities VZA/BidOnTaskBundle/Entity/$1 --no-backup
}

