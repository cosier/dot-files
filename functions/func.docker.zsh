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


# Docker
# alias docker='sudo docker'
alias compose='docker-compose -f $(git rev-parse --show-toplevel)/docker/development/docker-compose.yml'
alias compose-production='docker-compose -f $(git rev-parse --show-toplevel)/docker/production/docker-compose.yml'

alias cmp='source ~/.dot/functions/func.docker.zsh; compose'
alias cmpp='source ~/.dot/functions/func.docker.zsh; compose-production'

alias vmp='docker-compose -f ~/Developer/work/vop/docker-compose.yml'

alias b2d='boot2docker'
alias b2d-refresh-shell='eval "$(boot2docker shellinit)"'

alias dc='docker-compose'
alias dup='docker-compose up'
alias run='docker-compose run'
alias rst='docker-restart'
alias dm='docker-machine'

alias web='docker run -t tutum.co/hubify/web'
