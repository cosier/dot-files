#!/bin/bash
function keyboard-disable-caps()
{
  setxkbmap -option ctrl:nocaps
}
function keyboard-swap-caps()
{
  /usr/bin/setxkbmap -option "ctrl:swapcaps"
}


function keyboard-clear(){
  setxkbmap -layout us
}

function keyboard-install(){
  xkbset nullify lock
  xmodmap ~/.Xmodmap
  keyboard-swap-caps
}
