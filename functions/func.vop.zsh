function vop-db(){
  export DATABASE_URL='postgres://vop:hamster!$007@localhost:5432/vop_dev'
}

function build-vop(){
  TARGET=~/Developer/work/vop/$1
  if [ -d $TARGET ]; then
    docker build -t tutum.co/vopsy/$1 ~/Developer/work/vop/$1
  else
    echo "Unable to build: $TARGET"
  fi
}

export VOP_PRODUCTION_DB="postgres://vopsy:michigan007@db.staging.voiceofpsychic.com:5500/vopsy"

function vop-production-console(){
  DATABASE_URL=$VOP_PRODUCTION_DB rails console
}

function vop-production-migrate(){
  DATABASE_URL=$VOP_PRODUCTION_DB rake db:migrate
}

function vop-production-metal(){
  DATABASE_URL=$VOP_PRODUCTION_DB vopmetal
}

alias bv='build-vop'
alias v='vmp'
alias zenv='zen ~/Developer/work/vop'
alias zenvp='zen ~/Developer/work/vop/puma'

alias vc='vcprod'
alias vcprod='~/Developer/work/vop/bin/compose.production.sh'
alias vcdev='~/Developer/work/vop/bin/compose.development.sh'

alias vopmetal='~/Developer/work/vop/bin/start.metal.sh'
alias metal='vopmetal'

alias vs='~/Developer/work/vop/bin/start.sh'
# alias vp='~/Developer/work/vop/bin/start.production.sh'
alias vmstart='~/Developer/work/vop/bin/start.manual.sh'
alias vmstop='~/Developer/work/vop/bin/stop.manual.sh'
