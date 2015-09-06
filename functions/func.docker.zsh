function docker-env(){
  # export DOCKER_HOST=tcp://192.168.99.100:2376
  # export DOCKER_MACHINE_NAME=default
  # export DOCKER_TLS_VERIFY=1
  # export DOCKER_CERT_PATH=/Users/bailey/.docker/machine/machines/default

  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=/Users/bailey/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1
  echo "DOCKER_HOST: $DOCKER_HOST"
  echo "DOCKER_CERT_PATH: $DOCKER_CERT_PATH"
  echo "DOCKER_TLS_VERIFY: $DOCKER_TLS_VERIFY"

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
