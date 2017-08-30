alias emrc='em ~/.emacs.d/spacemacs.conf'
alias ec='eclient'

alias baileys-edit='vim ~/.emacs.d/private/baileys/packages.el'

function eclient(){
  NAME=$2
  if [ -z "$2" ]; then
    NAME='work'
  fi

  if [ -z "$1" ]; then
    FILE="./"
  else
    FILE=$1
  fi

  if [ -n "$3" ]; then
    echo "Unsupported third argument: $3"
    exit 1
  fi

  emacsclient --socket-name=$NAME $FILE
}

function emacsx() {
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
  /usr/local/bin/emacs --debug-init -nw $DIR
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
