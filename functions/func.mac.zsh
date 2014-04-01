#!/bin/zsh


function mac-display-off(){
  sudo nvram boot-args="iog=0x0"
}

function mac-nvram-reset(){
  sudo nvram -d boot-args
}
