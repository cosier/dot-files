
alias zen='source ~/.dot/functions/func.setup.zsh; setup-zen > /dev/null';
alias zen-edit='vim ~/.dot/functions/func.setup.zsh; zen';

function setup-clean(){
  tmux kill-window -a
  tmux move-window -t 0 2> /dev/null
}

function setup-dir() {
  if [ -n "$1" ]; then
    cd $1
  fi
}

function setup-tmkf() {
  if [ -n "$1" ]; then
    setup-dir $1
  fi
  setup-clean

  tmux rename-window BUILD
  tmux new-window -n "  V     "
  tmux new-window -n "  E     "
  tmux new-window -n "  ARI     "
  tmux new-window -n "  MTI     "
  tmux select-window -t 0
}

function setup-mbk() {
  if [ -n "$1" ]; then
    setup-dir $1
  fi
  setup-clean

  tmux rename-window Server

  tmux new-window -n "        V          "
  tmux new-window -n "        Z          "

  # tmux select-window -t 2
  # tmux send-keys -t 2 emacs Space -nw Enter

  tmux select-window -t 0
  # tmux send-keys vim Enter
}


function setup-vop() {
  if [ -n "$1" ]; then
    setup-dir $1
  fi
  setup-clean

  tmux rename-window Server

  tmux new-window -n "   MTL   "
  tmux new-window -n "   DKR   "
  tmux new-window -n "   CL3   "
  tmux new-window -n "   PMA   "
  tmux new-window -n "   MRC   "
  tmux new-window -n "   NGX   "

  # tmux select-window -t 2
  # tmux send-keys -t 2 emacs Space -nw Enter

  tmux select-window -t 0
  # tmux send-keys vim Enter
}

function setup-zen() {
  if [ -n "$1" ]; then
    setup-dir $1
  fi
  setup-clean

  tmux rename-window Server

  tmux new-window -n "   Zen      "
  # tmux move-window -s 3 -t 99

  # tmux select-window -t 2
  # tmux send-keys -t 2 emacs Space -nw Enter

  tmux select-window -t 0
  # tmux send-keys vim Enter

}


function setup-rails(){
  setup-clean

  tmux rename-window SERVER
  tmux new-window -n VIM
  tmux new-window -n SPACE
  tmux new-window -n CONSOLE
  tmux new-window -n REMOTE

  # tmux move-window -t 99
  tmux select-window -t 1
  tmux send-keys vim
  tmux send-keys Enter

  tmux select-window -t 2
  tmux send-keys spacemacs Space ./
  tmux send-keys Enter

  # tmux select-window -t 0
  # tmux send-keys rails Space server
  # tmux send-keys Enter
  # tmux select-window -t 3
  # tmux send-keys rails Space console
  # tmux send-keys Enter


  tmux select-window -t 1
}

function setup-basic() {
  setup-clean

  tmux rename-window SERVER
  tmux new-window -n EDITOR
  tmux new-window -n CONSOLE
  tmux select-window -t 0
}


function setup-servers(){
  setup-clean

  tmux rename-window REDIS
  tmux new-window -n POSTGRESQL
  tmux send-keys     postgres
  tmux new-window -n ELASTIC
  tmux send-keys     elasticsearch
}
