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
