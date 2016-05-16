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

function up-staging(){
  cd /vopsy;
  tmux rename-window STAGING;
  mosh c4.expertswap.com
}

function up-production(){
  cd /vopsy;
  tmux rename-window PRODUCTION;
  mosh z1deploy@c4x.voiceofpsychic.com
}
