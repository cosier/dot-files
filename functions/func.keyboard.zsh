#!/bin/bash
function keyboard-disable-caps()
{
  setxkbmap -option ctrl:nocaps
}

function keyboard-swap-caps()
{
  #/usr/bin/setxkbmap -option "ctrl:swapcaps"
}

function keyboard-more-caps()
{
  setxkbmap -option "caps:ctrl_modifier"
}


function keyboard-clear(){
  setxkbmap -layout us
}

function keyboard-install(){
  xkbset nullify lock
  xmodmap ~/.Xmodmap
  keyboard-swap-caps
}
