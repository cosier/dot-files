function setup-rails(){
  tmux rename-window SERVER
  tmux new-window -n EDITOR
  tmux new-window -n CONSOLE
  tmux new-window -n SCRATCH
  tmux new-window -n HEROKU
  # tmux new-window -n AUX
  # tmux move-window -t 99
  tmux select-window -t 1
  tmux send-keys vim
  tmux send-keys Enter
  tmux select-window -t 0
  tmux send-keys hubify-server
  tmux send-keys Enter
  tmux select-window -t 3
  tmux send-keys rails console
  tmux send-keys Enter


  tmux select-window -t 1
}

function setup-servers(){
  tmux rename-window REDIS
  tmux new-window -n POSTGRESQL
  tmux send-keys postgres
  tmux new-window -n ELASTIC
  tmux send-keys elasticsearch
}
