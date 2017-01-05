#!/bin/zsh

alias ts='tsession'
alias trr='t-rename'

alias t-rename='tmux rename-window'
alias t-rs-l='tmux resize-pane -L'
alias t-rs-r='tmux resize-pane -R'
alias t-rs-u='tmux resize-pane -U'
alias t-rs-d='tmux resize-pane -D'
alias tkill='tmux kill-session -t'

function tswap(){
  curr=$(tmux display-message -p '#I')
  tmux swap-window -s $curr -t $1
}

function tdrop(){
  tmux detach -a
}

function tserv(){
  screen -aADxRSU server $@
}

function tserv-connect(){
 screen -x server $@
}

function tsession(){
  if [[ -z "$1" ]]; then
    tmux list-session
    return
  fi

  tmux attach-session -t $@ -d || tmux new-session -s $@
}

alias tvbo='tmux-env vbo ~/Developer/work/vivo'
function tmux-env(){
  if [ -z "$1" ]
  then
    echo "Please provide a session name"
    return
  fi
  if [ -z "$2" ]
  then
    echo "Please provide a root directory"
    return
  fi

  SESSH="$1"
  ROOT="$2"
  tmux has-session -t $SESSH &> /dev/null

  if [ $? != 1 ]; then
    tkill $SESSH
  fi

  echo "Creating session $SESSH"
  tmux new-session -s $SESSH   -n SHLL -d
  tmux new-window  -t $SESSH:2 -n EDTOR
  tmux new-window  -t $SESSH:3 -n RMTE
  tmux new-window  -t $SESSH:4 -n CHILLY

  if [[ -f "$ROOT/NOTES.md" ]]
  then
    tmux new-window    -t $SESSH:0 -n NTES
    tmux select-window -t $SESSH:0
    tmux send-keys     -t $SESSH:0 "vim $ROOT/NOTES.md" C-m
  fi

  ONE="-1"
  TWO="-2"
  PANE1_SESSION=$SESSH$ONE
  PANE2_SESSION=$SESSH$TWO

  # Split SRV
  tmux split-window -h -t $SESSH:1.1 -d

  # Split EDTOR
  tmux split-window    -t $SESSH:2.1 -d

  # SRV - pane 1
  tmux select-window -t $SESSH:1
  tmux select-pane -t $SESSH:1.1
  tmux send-keys -t $SESSH:1 $ROOT   C-m
  tmux send-keys -t $SESSH:1 "rserv" C-m

  # EDTOR - pane 1
  tmux select-window -t $SESSH:2
  tmux select-pane -t $SESSH:2.1
  tmux send-keys -t $SESSH:2 $ROOT   C-m
  tmux send-keys -t $SESSH:2 "vim ." C-m
  tmux send-keys -t $SESSH:2 ":OpenSession! $PANE1_SESSION" C-m
  tmux send-keys -t $SESSH:2 "" C-m
  # EDTOR - pane 2
  tmux select-window -t $SESSH:2
  tmux select-pane -t $SESSH:2.2
  tmux send-keys -t $SESSH:2 "vim ." C-m
  tmux send-keys -t $SESSH:2 ":OpenSession! $PANE2_SESSION" C-m
  tmux send-keys -t $SESSH:2 "" C-m

  tmux send-keys -t $SESSH:3 "cd $ROOT"   C-m

  ts $SESSH

}

