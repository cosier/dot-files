#!/bin/zsh


function mysql-streem(){
  echo "setting up mysql streem tunnel"
  ssh -v -C -R kevin:3306:julia:3307  -p 21212 deploy@julia.streem.com.au
}

function hot-mysql-streem(){
  source ~/.dot/functions/func.mysql.zsh;
  mysql-streem
}


