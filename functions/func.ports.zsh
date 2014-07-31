#!/bin/zsh


function port-stat(){
  lsof -n -i4TCP:$1 | grep LISTEN
}

