#!/bin/zsh

alias precompile='RAILS_ENV=production rake assets:precompile'
alias capd='cap deploy'

function deploy-smartdorks(){
  git add .
  git commit -m "Auto deploy"
  git push smartdorks master:master
  ssh ubuntu@smartdorks.com "cd /var/www/streem; git pull origin master; pm2 restart all"
}
function deploy-streem(){
  git add .
  git commit -m "Auto deploy"
  git push streem master:master
  ssh root@streem "cd /var/www/ranking; git pull origin master; pm2 restart 0"
}

function deploy-updater(){
  git add .
  git commit -m "Auto deploy"
  git push streem master
  ssh root@streem "cd /var/www/updater; git pull origin master; pm2 restart all"
}

function deploy-skej(){
  git push heroku master;
  git push origin master;
}

function deploy-backorders(){
  git push origin master &;
  git push heroku master;
}

alias bodeploy='deploy-backorders'

deploy-prime(){
  default=ezcontacts

  if [[ -z "$1" ]]
  then
    stage=$default
  else
    stage=$1
  fi

  echo "-----------------------"
  echo "Deploying to $stage"
  echo "-----------------------"
  echo "Are you sure? - CTRL-C if your not feelin it"
  read -rs -k 1 REPLY

  cap $stage deploy

}

