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
