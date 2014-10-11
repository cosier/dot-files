
#alias prime-serv='RAILS_ENV=development unicorn -c config/unicorn.rb'

alias prime-engines='cd /var/www/prime/lib/prime'
alias prime-clients='cd /var/www/prime/lib/clients'

alias engines='prime-engines'
alias clients='prime-clients'
function push-prime(){
  git push withjive staging:staging
  git push wearmytags staging:staging
}


alias client='gr; cd lib/clients/*'
