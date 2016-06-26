function t(){
  tmux rename-window $@
}
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
  tmux move-window -t 98
  mosh c4.expertswap.com
}

function up-hubify(){
  cd /vopsy;
  tmux rename-window STAGING;
  tmux move-window -t 98
  mosh xena@hubify
}

function up-production(){
  cd /vopsy;
  tmux rename-window PRODUCTION;
  tmux move-window -t 99
  mosh z1deploy@c4x.voiceofpsychic.com
}
