alias emrc='em ~/.emacs.d/spacemacs.conf'

function emacs() {
  if [[ "$(which emacs-26.0.50)" != "" ]]; then
    cmd="emacs-26.0.50"
  else
    cmd="$(which emacs)"
  fi
  $cmd $@
}

function em(){
  if [ -z "$1" ]; then
    DIR=$(pwd)
  else
    DIR=$1
  fi

  if [ -z "$EMS" ]; then
    EMS=vop
  fi
  # echo "Starting emacs: $EMS at $DIR"
  # emacsclient --server-file=$EMS $DIR
  emacs -nw $DIR
}

function emi(){
  if [ -z "$1" ]; then
    DIR=$(pwd)
  else
    DIR=$1
  fi

  if [ -z "$EMS" ]; then
    EMS=vop
  fi
  # echo "Starting emacs: $EMS at $DIR"
  # emacsclient --server-file=$EMS $DIR
  emacs --insecure -nw $DIR
}

function emacs-server(){

  NAME=$1
  if [ -z "$1" ]; then
    NAME='work'
  fi

  echo "Starting Emacs server($NAME)"
  emacs24 --daemon=$NAME
}

alias ems='emrc; emacs-server'
