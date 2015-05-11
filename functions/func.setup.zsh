function setup-rails(){
  tmux rename-window SERVER
  tmux new-window -n EDITOR
  tmux new-window -n CONSOLE
  tmux new-window -n LOGS
  tmux new-window -n TUNNEL
  # tmux new-window -n AUX
  # tmux move-window -t 99
  tmux select-window -t 1
}

function setup-servers(){
  tmux rename-window REDIS
  tmux new-window -n POSTGRESQL
}
