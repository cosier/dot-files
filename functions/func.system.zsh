#!/bin/zsh

function killprocessgood(){
    target=$1;
    # ps aux | grep $target | grep -v grep | awk '{print $2}'
    pids=$(ps aux | grep $target | grep -v grep | awk '{print $2}' | head -n1)

    for p in $pids; do
      AUX=$(ps aux | grep $p | grep -v grep | awk '{ print $11 }')
      END2=$(ps aux | grep $p | grep -v grep | awk '{ print $12 }')
      echo "PID: $p -> $AUX / $END2";
      # sudo kill $p
    done


    if [[ -n "$pids" ]]; then
      # echo "_____________\n"
      # echo "Are you sure?"

      # read confirmation
      confirmation='yes'

      if [[ "$confirmation" != "yes" ]]; then
        echo "Aborting due to answer: $confirmation"
      else
        for p in $pids
        do
          pid=${p//[^a-zA-Z0-9_]/}
          sudo kill -9 $pid
          echo "Killed: $pid"
        done
      fi
    else
      echo "\nNo pids found: $pids for $target\n"
    fi

}

alias kp='source ~/.dot/functions/func.system.zsh; killprocessgood'
alias k='kp'

alias kp-defined-in='echo "system.func.zsh"'
alias k-defined-in='echo "system.func.zsh"'

function retcode(){
  "$@"
  local status="$?"
  if [ $status -ne 0 ]; then
    echo "error with $1" >&2
  fi
  return $status
}


