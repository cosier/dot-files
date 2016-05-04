alias emrc='em ~/.emacs.d/spacemacs.conf'

function em(){
  if [ -z "$1" ]; then
    DIR=$(pwd)
  else
    DIR=$1
  fi

  if [ -z "$EMS" ]; then
    EMS=vop
  fi
  echo "Starting emacs: $EMS at $DIR"
  emacsclient --server-file=$EMS $DIR
}

function emacs-server(){

  NAME='work'
  if [ -n "$1" ]; then
    NAME=$1
  fi

  echo "Starting Emacs server($NAME)"
  emacs24 --daemon=$NAME
}

alias ems='emrc; emacs-server'
