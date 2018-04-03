function docker-logs(){
  if [ -z "$1" ]; then
    echo "No service name provided"
    return
  fi

  docker logs --follow $1
}

function docker-mongo() {
  docker run -p 27017:27017 --name mongo-server -t mongo:3.4-jessie $@
}

function docker-host-local(){
  export DOCKER_HOST=unix:///var/run/docker.sock
}

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

function docker-kill-runners(){
  docker kill $(app ps | grep run | awk '{ print $1 }')
}

function docker-cleanup(){
  docker images --no-trunc| grep none | awk '{print $3}' | xargs -r docker rmi
}


function shipyard-cli(){
  docker run -it shipyard/shipyard-cli
}

function docker-ip(){
  docker-machine ip fusion
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

function docker-kill-all(){
  docker kill $(docker ps | awk '{ print $1 }')
}


# Docker
# alias docker='sudo docker'
alias compose='docker-compose -f $(git rev-parse --show-toplevel)/docker/development/docker-compose.yml'
alias compose-production='docker-compose -f $(git rev-parse --show-toplevel)/docker/production/docker-compose.yml'

alias b2d='boot2docker'
alias b2d-refresh-shell='eval "$(boot2docker shellinit)"'

####################################
function docker-tuloko(){
  docker run \
    -v ~/Developer/work/bundles/tuloko:/usr/local/bundle \
    -v ~/Developer/work/tuloko:/app \
    -e MONGO_HOST='192.168.1.3' \
    -e MONGO_DATABASE=tuloku-dev \
    -t cosier/ruby-1.9.3 $@
}

alias tulo='source ~/.dot/functions/func.docker.zsh; docker-tuloko'
alias tulu='tulo'
