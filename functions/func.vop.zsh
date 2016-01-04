function vop-db(){
  export DATABASE_URL='postgres://vop:hamster!$007@localhost:5432/vop_dev'
}

function build-vop(){
  TARGET=vop; $1
  if [ -d $TARGET ]; then
    docker build -t tutum.co/vopsy/$1 vop; $1
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

function docker-vop(){
  $(docker-vop-echo) $@
}

function docker-vop-echo(){
  echo "docker --tlsverify --tlscacert=/vopsy/shared/certs/fullchain.pem --tlscert=/vopsy/shared/certs/cert.pem --tlskey=/vopsy/shared/certs/private.pem $@"
}

function docker-vop-set-host(){
  export DOCKER_HOST="tcp://local.voiceofpsychic.com:2376"
}

alias bv='build-vop'
alias v='vmp'
alias zenv='vop; zen'
alias zenvp='zen /vopsy; cd puma'

alias vc='vcprod'
alias vcprod='vop; bin/compose.production.sh'
alias vcdev='vop; bin/compose.development.sh'

alias metal='vop; bin/start.metal.sh'
alias vs='vop; bin/start.sh'
alias vp='vop; bin/start.production.sh'
alias vmstart='vop; bin/start.manual.sh'
alias vmstop='vop; bin/stop.manual.sh'

alias mosh-vop-staging='mosh dx.staging.voiceofpsychic.com'
alias ssh-vop-staging='ssh bailey@dx.staging.voiceofpsychic.com'

function tunnel-vop(){
  REMOTE=$1
  LOCAL=$1
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL sg.voiceofpsychic.com -v
}
alias tunnel-vop-puma='source ~/.dot/functions/func.vop.zsh; tunnel-vop 3000'
alias tunnel-vop-mercury='source ~/.dot/functions/func.vop.zsh; tunnel-vop 8181'
