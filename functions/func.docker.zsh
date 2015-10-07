function docker-env(){
  if [ -z "$1" ]; then
    echo 'Docker Machine for Fusion'
    target='fusion'
  else
    echo "Docker Machine for $1"
    target=$1
  fi

  eval "$(docker-machine env $target)"

  if [ -z "$2" ]; then
    echo "DOCKER_HOST: $DOCKER_HOST"
    echo "DOCKER_CERT_PATH: $DOCKER_CERT_PATH"
    echo "DOCKER_TLS_VERIFY: $DOCKER_TLS_VERIFY"
  fi
}

function shipyard-cli(){
  docker run -it shipyard/shipyard-cli
}

function docker-ip(){
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID} $@
}

function docker-debug(){
  pry-remote -w -s $(docker-ip core_web_1)
}

function docker-restart(){
  docker-compose stop $@
  docker-compose start $@
}

function docker-logs-clear(){
  sudo bash -c "ls /var/lib/docker/containers/*/*.log | xargs rm"
}

alias dc='docker-compose'
alias dup='docker-compose up'
alias run='docker-compose run'
alias rst='docker-restart'
alias dm='docker-machine'
