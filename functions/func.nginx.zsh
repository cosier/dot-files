#!/bin/zsh

#####################################
# Nginx Management
# alias nginx='sudo nginx'

alias sites-enabled='cd /usr/local/etc/nginx/sites-enabled'
alias nginx-sites='sites-enabled'

function ngx(){
  PIDS=$(sudo ps aux | grep nginx | awk '{ print $2 }')
  echo "Restarting NGINX: PID(s) -> $PIDS"
  sudo kill -USR1 $PIDS
}

function ngx-sites(){
  echo "Sites in Enabled:"
  ls -la /usr/local/etc/nginx/sites-enabled
  echo "-----------------------"
  echo "Sites in Holding:"
  ls -la /usr/local/etc/nginx/sites-holding
  echo "-----------------------"
}

function ngx-enable-site(){
  if [[ -z "$1" ]]; then;
    echo "Ooops! No site param provided :<"; return;
  fi

  site=$1
  echo "Moving Site ($site) to Enabled folder"
  mv /usr/local/etc/nginx/sites-holding/$site.nginx /usr/local/etc/nginx/sites-enabled/;
}

function ngx-disable-site(){
  if [[ -z "$1" ]]; then;
    echo "Ooops! No site param provided :<"; return;
  fi

  site=$1
  echo "Moving Site ($site) to Holding folder"
  mv /usr/local/etc/nginx/sites-enabled/$site.nginx /usr/local/etc/nginx/sites-holding/;
}

