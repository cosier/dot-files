alias emrc='em ~/.emacs.d/spacemacs.conf'

function em(){
  if [ -z "$1" ]; then
    DIR='.'
  else
    DIR=$1
  fi
  emacsclient $@
}

function ems(){
  killall emacs24
  emacs24 --daemon
}
