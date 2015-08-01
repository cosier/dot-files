#!/bin/zsh


function py-serv(){
  python -m SimpleHTTPServer
}

function tour-server(){
  rails server -p 9000
}

function scaleboom-server(){
  rails server -p 6464
}

function dynamic-server(){
  rails server -p 2020
}

function hubify-server(){
  # rails server -p 2323
  unicorn -c config/unicorn.rb --listen '0.0.0.0:2323'
}

function hubify-ngrok(){
  ngrok -hostname=hubify.cosier.ca -log='stdout' 2323
}

function skejio-ngrok(){
  ngrok -hostname=skejio.cosier.ca -log='stdout' 4545
}

function skejio-server(){
  thin start -p 4545
}


function bgrok(){
  ngrok -hostname=backorders.cosier.ca 9191
}

function backorders-server(){
  rails server -p 9191
}
function backorders-server-production(){
  RAILS_ENV=production rails server -p 9292
}


alias boserv='backorders-server'
alias skserv='skejio-server'
alias dserv='dynamic-server'
alias sbserv='scaleboom-server'

