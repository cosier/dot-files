#!/bin/sh



function restart-puma(){
  pid=$(sudo ps aux | grep puma | grep 3000 | awk '{ print $2 }')

  echo "Sending kill signal to $pid"
  sudo kill -USR1 $pid
}

alias kpuma='restart-puma'
alias rpm='source ~/.dot/functions/func.puma.zsh; restart-puma'
