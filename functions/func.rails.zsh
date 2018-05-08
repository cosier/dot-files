#!/bin/zsh

function rkill(){
  sudo kill -9 $(cat tmp/pids/server.pid)
}

function rserv(){
  if [ -f ./tmp/pids/server.pid ]; then
    clr_red "Stopping existing Rails server..."
    sudo kill -9 `cat tmp/pids/server.pid`
  fi
  local port=3000
  if [[ ! -z "$1" ]]; then; clr_green "Setting Default port: $1"; port=$1; fi;

  clr_cyan "Starting Rails"
  rails server --port=$port
}

function rails-db-reload(){
  rake db:schema:load
  rake db:seed
}

function test-server(){
  RAILS_ENV=test rails server -p 9000 -P tmp/pids/test_server_9000.pid
}

function console-prod(){
  RAILS_ENV=production rails console
}

function console(){
  cur=$(pwd)
  gr; bin/rails console $@
  cd $cur
}


alias rails-mrbigboss='rails s -p 8484'
alias rails-dabadoc='rails s -p 3030'
alias rails-studio='rails s -p 5000'
alias rails-imoto='rails s -p 4000'
alias rails-core='rails s -p 9010'
alias rails-tuloko='rails s -p2424'
alias rails-tender='rails s -p3030'
alias rails-market='rails s -p2020'

