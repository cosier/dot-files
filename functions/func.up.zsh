function up-ngx(){
  cd /vopsy/nginx;
  tmux rename-window NGX
}

function up-pma(){
  cd /vopsy/puma;
  tmux rename-window PMA
}

function up-mrc(){
  cd /vopsy/mercury;
  tmux rename-window MRC
}

function up-pmc(){
  cd /vopsy/client;
  tmux rename-window CLIENT
}

function up-metal(){
  cd /vopsy;
  tmux rename-window METAL;
  clear
  metal
}

