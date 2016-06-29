function vop-port(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi
  SERVICE=$1
  shift

  app ps $SERVICE | grep $SERVICE | awk '{ print $7}' | tr ':' '\n' | grep "\->" | tr '\->' '\n' | grep -v tcp
}

function vop-service(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi
  file=/vopsy/var/compose/includes/_$1.yml
  if [ ! -f $file ]; then
    echo "File does not exist: $file"
    return
  else
    vim $file
  fi
}

function vop-env(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi

  if [ -z "$EDITOR" ]; then
    EDITOR=vim
  fi

  file=/vopsy/var/env/$1/development.env
  if [ ! -f $file ]; then
    echo "File does not exist: $file"
    return
  else
    $EDITOR $file
  fi
}



alias app='rocket'

function vop-db(){
  export DATABASE_URL='postgres://vop:hamster!$007@localhost:5432/vop_dev'
}

function vop-build(){
  [ ! -d /vopsy/$1 ]; echo "Directory does not exist:" >2 exit 3
  cd /vopsy/$1
  docker build -t vopnl1/$1 .
}

alias b='vop-build'

function vop-logs(){
  /vopsy/bin/logs.sh
}

function vop-client(){
  sudo CODE_CACHE=on CLIENT_PORT_80=80 CLIENTPORT_443=443 /vopsy/client/bin/start.sh
}

function vop-db(){
  /vopsy/db/bin/start.sh
}

function vop-redis(){
  redis-cli -h dx.staging.voiceofpsychic.com -a vopredmachina419 $@
}

function vop-redis-local(){
  redis-cli -h 127.0.0.1 -a vopredmachina419 $@
}

function vop-z1(){
  mosh z1deploy@c4x.voiceofpsychic.com
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

function vop-production-db-dump(){
  pg_dump --verbose -Fc --no-acl --no-owner $VOP_PRODUCTION_DB > vop_production_$(date '+%Y%m%d').dump
}

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

function vop-c4(){
  mosh c4.voiceofpsychic.com
}

function vop-socket(){
  mosh socket.voiceofpsychic.com
}

function vop-mrc(){
  /vopsy/mercury/bin/start.sh $@
}
function vop-lander(){
  /vopsy/lander/bin/start.sh $@
}

function vop-ramit(){
  sudo rm /vopsy
  sudo ln -sf /ram/vop /vopsy
}

function vop-diskit(){
  sudo rm /vopsy
  sudo ln -fs ~bailey/Developer/work/vop /vopsy
}

function vop-ram-init(){
  sudo cp -Rv ~bailey/Developer/work/vop/ /ram/vop/
}

function vop-ram-dump(){
  if [[ -z "$1" ]]; then
    # sudo cp -R /ram/vop/ ~bailey/Developer/work/
    sudo rsync --delete -a --progress /ram/vop/ ~bailey/Developer/work
  else
    sudo rsync --delete -a --progress /ram/vop/$1 ~bailey/Developer/work/vop
  fi
}

# alias dump='vop-ram-dump'

# alias pma-dump='vop-ram-dump puma'
# alias mrc-dump='vop-ram-dump mercury'

# alias pma-serv='APP_ENV=development WEBPACK_DEV_HOST=local.voiceofpsychic.com WEBPACK_DEV_PORT=443 WEBPACK_DEV_PROTOCOL=https DISABLE_PUMA=false /vopsy/puma/bin/start.sh'
# alias js-serv='WEBPACK_FORCE=true /vopsy/puma/bin/webpack.sh'
# alias redis-serv='/vopsy/redis/bin/start.sh'

# alias bv='build-vop'
# alias v='vmp'
# alias zenv='vop; zen'
# alias zenvp='zen /vopsy; cd puma'

# alias vc='vcprod'
# alias vcprod='vop; bin/compose.production.sh'
# alias vcdev='vop; bin/compose.development.sh'

# alias metal='vop; emmy/bin/start.metal.sh'
# alias vs='vop; bin/start.sh'
# alias vp='vop; bin/start.production.sh'
# alias vmstart='vop; bin/start.manual.sh'
# alias vmstop='vop; bin/stop.manual.sh'

# alias mosh-vop-staging='mosh dx.staging.voiceofpsychic.com'
# alias ssh-vop-staging='ssh bailey@dx.staging.voiceofpsychic.com'

function tunnel-vop-local(){
  REMOTE=$1
  LOCAL=$2
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL dx.local.voiceofpsychic.com -v
}

function tunnel-vop-c4(){
  REMOTE=$1
  LOCAL=$2
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL c4.expertswap.com -v
}
alias tunnel-vop='source ~/.dot/functions/func.vop.zsh; tunnel-vop-local 9980 80'
