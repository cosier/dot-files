alias zune='cd /zune'
alias z='zune'

function zune-port(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi
  SERVICE=$1
  shift

  app ps $SERVICE | grep $SERVICE | awk '{ print $7}' | tr ':' '\n' | grep "\->" | tr '\->' '\n' | grep -v tcp
}

function zune-service(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi
  file=/zunesy/var/compose/includes/_$1.yml
  if [ ! -f $file ]; then
    echo "File does not exist: $file"
    return
  else
    vim $file
  fi
}

function zune-env(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi

  if [ -z "$EDITOR" ]; then
    EDITOR=vim
  fi

  file=/zunesy/var/env/$1/development.env
  if [ ! -f $file ]; then
    echo "File does not exist: $file"
    return
  else
    $EDITOR $file
  fi
}



alias app='rocket'

function zune-db(){
  export DATABASE_URL='postgres://zune:hamster!$007@localhost:5432/zune_dev'
}

function zune-build(){
  /zune/bin/build.sh
}

function zune-logs(){
  /zunesy/bin/logs.sh
}

function zune-client(){
  sudo CODE_CACHE=on CLIENT_PORT_80=80 CLIENTPORT_443=443 /zunesy/client/bin/start.sh
}

function zune-db(){
  /zunesy/db/bin/start.sh
}

function zune-redis(){
  redis-cli -h dx.staging.voiceofpsychic.com -a zuneredmachina419 $@
}

function zune-redis-local(){
  redis-cli -h 127.0.0.1 -a zuneredmachina419 $@
}

function zune-z1(){
  mosh z1deploy@c4x.voiceofpsychic.com
}

function build-zune(){
  TARGET=zune; $1
  if [ -d $TARGET ]; then
    docker build -t tutum.co/zunesy/$1 zune; $1
  else
    echo "Unable to build: $TARGET"
  fi
}

export VOP_PRODUCTION_DB="postgres://zunesy:michigan007@db.staging.voiceofpsychic.com:5500/zunesy"

function zune-production-db-dump(){
  pg_dump --verbose -Fc --no-acl --no-owner $VOP_PRODUCTION_DB > zune_production_$(date '+%Y%m%d').dump
}

function zune-rake(){
  DATABASE_URL=$VOP_PRODUCTION_DB rake $@
}

function zune-production-console(){
  DATABASE_URL=$VOP_PRODUCTION_DB rails console
}

function zune-production-migrate(){
  DATABASE_URL=$VOP_PRODUCTION_DB rake db:migrate
}

function zune-production-metal(){
  DATABASE_URL=$VOP_PRODUCTION_DB zunemetal
}

function docker-zune(){
  cmd=$(docker-zune-echo $@)
  sh -c $cmd
}

function docker-zune-echo(){
  echo "docker --tlsverify --tlscacert=/zunesy/shared/certs/fullchain.pem --tlscert=/zunesy/shared/certs/cert.pem --tlskey=/zunesy/shared/certs/private.pem $@"
}

function docker-zune-set-host(){
  export DOCKER_HOST="tcp://local.voiceofpsychic.com:2376"
}

function docker-zune-socket(){
  DOCKER_HOST=tcp://socket.voiceofpsychic.com:2376 \
    docker \
      --tlsverify \
      --tlscacert=/zunesy/shared/certs/fullchain.pem \
      --tlscert=/zunesy/shared/certs/cert.pem \
      --tlskey=/zunesy/shared/certs/private.pem \
      $@
}

function docker-zune-staging(){
  DOCKER_HOST=tcp://dx.staging.voiceofpsychic.com:2376 \
    docker \
      --tlsverify \
      --tlscacert=/zunesy/shared/certs/fullchain.pem \
      --tlscert=/zunesy/shared/certs/cert.pem \
      --tlskey=/zunesy/shared/certs/private.pem \
      $@
}

function zune-c4(){
  mosh c4.voiceofpsychic.com
}

function zune-socket(){
  mosh socket.voiceofpsychic.com
}

function zune-mrc(){
  /zunesy/mercury/bin/start.sh $@
}
function zune-lander(){
  /zunesy/lander/bin/start.sh $@
}

function zune-ramit(){
  sudo rm /zunesy
  sudo ln -sf /ram/zune /zunesy
}

function zune-diskit(){
  sudo rm /zunesy
  sudo ln -fs ~bailey/Developer/work/zune /zunesy
}

function zune-ram-init(){
  sudo cp -Rv ~bailey/Developer/work/zune/ /ram/zune/
}

function zune-ram-dump(){
  if [[ -z "$1" ]]; then
    # sudo cp -R /ram/zune/ ~bailey/Developer/work/
    sudo rsync --delete -a --progress /ram/zune/ ~bailey/Developer/work
  else
    sudo rsync --delete -a --progress /ram/zune/$1 ~bailey/Developer/work/zune
  fi
}

alias dump='zune-ram-dump'

alias pma-dump='zune-ram-dump puma'
alias mrc-dump='zune-ram-dump mercury'

alias pma-serv='APP_ENV=development WEBPACK_DEV_HOST=local.voiceofpsychic.com WEBPACK_DEV_PORT=443 WEBPACK_DEV_PROTOCOL=https DISABLE_PUMA=false /zunesy/puma/bin/start.sh'
alias js-serv='WEBPACK_FORCE=true /zunesy/puma/bin/webpack.sh'
alias redis-serv='/zunesy/redis/bin/start.sh'

# alias bv='build-zune'
alias v='vmp'
alias zenv='zune; zen'
alias zenvp='zen /zunesy; cd puma'

alias vc='vcprod'
alias vcprod='zune; bin/compose.production.sh'
alias vcdev='zune; bin/compose.development.sh'

alias metal='zune; emmy/bin/start.metal.sh'
alias vs='zune; bin/start.sh'
alias vp='zune; bin/start.production.sh'
alias vmstart='zune; bin/start.manual.sh'
alias vmstop='zune; bin/stop.manual.sh'

alias mosh-zune-staging='mosh dx.staging.voiceofpsychic.com'
alias ssh-zune-staging='ssh bailey@dx.staging.voiceofpsychic.com'

function tunnel-zune-local(){
  REMOTE=$1
  LOCAL=$2
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL dx.local.voiceofpsychic.com -v
}

function tunnel-zune-c4(){
  REMOTE=$1
  LOCAL=$2
  ssh -N -R \*:$REMOTE:0.0.0.0:$LOCAL c4.expertswap.com -v
}
alias tunnel-zune='source ~/.dot/functions/func.zune.zsh; tunnel-zune-local 9980 80'
