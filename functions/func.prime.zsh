
alias prime-serv='RAILS_ENV=development unicorn -c config/unicorn.rb'

alias prime-engines='cd /var/www/prime/lib/prime'
alias prime-clients='cd /var/www/prime/lib/clients'

alias engines='prime-engines'
alias clients='prime-clients'
function push-prime(){
  git push withjive staging:staging
  git push wearmytags staging:staging
}

function prime-db-switch(){
  git-root

  client=$1
  if [[ -z "$client" ]]; then
    client="ez_contacts"
  fi

  echo "Switching Database for: $client"
  source=$(pwd)/config/database.$client.yml
  dest=$(pwd)/config/database.yml
  echo "source: $source"
  echo "dest: $dest"

  ln -sf $source $dest
}

function prime-db-reset(){
  client=$1
  if [[ -z "$client" ]]; then
    client="ez_contacts"
  fi

  rake db:reset
  APP=$client rake db:seed
}


