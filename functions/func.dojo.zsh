#!/bin/bash

alias trun='tatami-run'
alias tbuild='tatami-builder'

function tatami-run(){
  TYPE=debug
  if [[ ! -z $1 ]]; then
    TYPE=$1;
  fi
  echo "Running App::${TYPE}"
  /Developer/work/dojopad/client/tatami/build/$TYPE/tatami.app/Contents/MacOS/tatami
}

function tatami-builder(){
  /Developer/work/dojopad/client/tatami/tools/builder.sh $@
  cd /Developer/work/dojopad/client/tatami/build/
}


function dojomux(){

  SESSH="$1"
  ROOT="$2"
  tmux has-session -t $SESSH &> /dev/null

  if [ $? != 1 ]; then
    tkill $SESSH
  fi
}

