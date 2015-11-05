function setup-rails(){
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
  tmux rename-window SERVER
  tmux new-window -n EDITOR
  tmux new-window -n CONSOLE
  tmux select-window -t 0
}

function setup-servers(){
  tmux rename-window REDIS
  tmux new-window -n POSTGRESQL
  tmux send-keys     postgres
  tmux new-window -n ELASTIC
  tmux send-keys     elasticsearch
}

function setup-vop(){
  tmux rename-window SERVER

  tmux new-window -n MERCURY
  tmux send-keys     vop; Space cd Space mercury; Space vim Space . Enter

  tmux new-window -n NGINX
  tmux send-keys     vop; Space cd Space nginx; Space vim Space . Enter

  tmux new-window -n PUMA
  tmux send-keys     vop; Space cd Space puma; Space vim Space . Enter

  tmux new-window -n CONSOLE
  # tmux send-keys     elasticsearch
}
