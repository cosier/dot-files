function setup-rails(){
  tmux rename-window SERVER
  tmux new-window -n EDITOR
  tmux new-window -n CONSOLE
  # tmux new-window -n HEROKU
  # tmux new-window -n AUXSRVS
  tmux new-window -n DOCKER
  # tmux new-window -n DOCKER

  # tmux move-window -t 99
  tmux select-window -t 1
  tmux send-keys vim
  tmux send-keys Enter
  # tmux select-window -t 0
  # tmux send-keys rails Space server
  # tmux send-keys Enter
  # tmux select-window -t 3
  # tmux send-keys rails Space console
  # tmux send-keys Enter


  tmux select-window -t 1
}

function setup-compilers() {
  tmux rename-window COMPILER
  tmux new-window -n EDITOR
}

function setup-servers(){
  tmux rename-window REDIS
  tmux new-window -n POSTGRESQL
  tmux send-keys postgres
  tmux new-window -n ELASTIC
  tmux send-keys elasticsearch
}
