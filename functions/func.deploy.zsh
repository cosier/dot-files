#!/bin/zsh


function deploy(){
    local GITROOT="$(git rev-parse --show-toplevel)";
    $GITROOT/bin/autodeploy.sh $@
}

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

