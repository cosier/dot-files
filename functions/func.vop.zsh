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

function vop-rake(){
  DATABASE_URL=$VOP_PRODUCTION_DB rake $@
}

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
  cmd=$(docker-vop-echo $@)
  sh -c $cmd
}

function docker-vop-echo(){
  echo "docker --tlsverify --tlscacert=/vopsy/shared/certs/fullchain.pem --tlscert=/vopsy/shared/certs/cert.pem --tlskey=/vopsy/shared/certs/private.pem $@"
}

function docker-vop-set-host(){
  export DOCKER_HOST="tcp://local.voiceofpsychic.com:2376"
}

function docker-vop-socket(){
  DOCKER_HOST=tcp://socket.voiceofpsychic.com:2376 \
    docker \
      --tlsverify \
      --tlscacert=/vopsy/shared/certs/fullchain.pem \
      --tlscert=/vopsy/shared/certs/cert.pem \
      --tlskey=/vopsy/shared/certs/private.pem \
      $@
}

function docker-vop-staging(){
  DOCKER_HOST=tcp://dx.staging.voiceofpsychic.com:2376 \
    docker \
      --tlsverify \
      --tlscacert=/vopsy/shared/certs/fullchain.pem \
      --tlscert=/vopsy/shared/certs/cert.pem \
      --tlskey=/vopsy/shared/certs/private.pem \
      $@
}

alias pma-serv='WEBPACK_DEV_PROTOCOL=https WEBPACK_DEV_HOST=local.voiceofpsychic.com WEBPACK_DEV_PORT=443 DISABLE_PUMA=false /vopsy/puma/bin/start.sh'
alias js-serv='WEBPACK_FORCE=true /vopsy/puma/bin/webpack.sh'
alias redis-serv='/vopsy/redis/bin/start.sh'

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
  LOCAL=$2
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL socket.voiceofpsychic.com -v
}
alias tunnel-vop-nginx='source ~/.dot/functions/func.vop.zsh; tunnel-vop 9999 80'
alias tunnel-vop-webpack='source ~/.dot/functions/func.vop.zsh; tunnel-vop 3808 3808'
# alias tunnel-vop-mercury='source ~/.dot/functions/func.vop.zsh; tunnel-vop 8181'
