#!/bin/sh



function restart-puma(){
  pid=$(sudo ps aux | grep puma | grep 3000 | awk '{ print $2 }')

  if [ -n $pid ]; then
    echo "No pid found for puma: $pid"
  else
    echo "Sending kill signal to $pid"
    sudo kill -USR1 $pid
  fi
}

alias kpuma='restart-puma'
alias rpm='source ~/.dot/functions/func.puma.zsh; restart-puma'
