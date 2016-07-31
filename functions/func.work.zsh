
alias door='service-doorman'
alias vev='env-service'
alias vps='compose-service'
alias b='build-service'
alias build='build-service'
alias logs='logs-service'
alias l='logs'
alias srv='app-mount; cd services'
alias pad='srv; cd padrino'
alias mrc='srv; cd mercury'
alias pmc='src; cd client'

function app-mount(){
  mount-reload
  cd $APP_MOUNT
}

function mount-hubify(){
  export APP_MOUNT=/hubify
  export APP_NAME=hubify
  mount-save
}

function mount-crowdist(){
  export APP_MOUNT=~/Developer/work/crowdist/barge
  export APP_NAME=crowdist
  mount-save
}

function mount-zune(){
  export APP_MOUNT=/zune
  export APP_NAME=zune
  mount-save
}

function mount-save(){
  if [ -n "$APP_MOUNT" ]; then
    echo "$APP_MOUNT" > ~/.app_mount
  fi

  if [ -n "$APP_NAME" ]; then
    echo "$APP_NAME" > ~/.app_name
  fi
}

function mount-reload(){
  if [ -f ~/.app_mount ]; then
    export APP_MOUNT=$(cat ~/.app_mount)
  else
    export APP_MOUNT=/hubify
  fi
  if [ -f ~/.app_name ]; then
    export APP_NAME=$(cat ~/.app_name)
  else
    export APP_NAME=hubify
  fi
}

if [ -z "$APP_MOUNT" ]; then
  mount-reload
fi
if [ -z "$APP_NAME" ]; then
  mount-reload
fi

function logs-service(){
  if [ -z "$APP_NAME" ]; then
    echo "APP_NAME not defined"
    return
  fi

  $APP_NAME logs -f $1
}

function padrion-service(){
  if [ -z "$APP_MOUNT" ]; then
    echo "APP_MOUNT not defined"
    return
  fi

  cd $APP_MOUNT/services/padrino

}

function client-service(){
  if [ -z "$APP_MOUNT" ]; then
    echo "APP_MOUNT not defined"
    return
  fi

  CLIENT_ROOT=$APP_MOUNT/services/client
  cd $CLIENT_ROOT
}

function build-service(){
  if [ -z "$APP_NAME" ]; then
    echo "APP_NAME not defined"
    return
  fi

  service=$1
  echo "$APP_NAME: building"
  $APP_NAME build $service
}

function compose-service(){
  service=$1

  COMPOSE=$APP_MOUNT/vault/compose/includes/_$service.yml
  vim $COMPOSE
}

function env-service(){
  service=$1

  SDIR=$APP_MOUNT/vault/env/$service
  vim $SDIR
}

function service-doorman(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

  if [ -z "$1" ]; then
    cd $APP_MOUNT/services/doorman
  else
    echo "Doorman: Hello!"
  fi
}

function service-client(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

  if [ -z "$1" ]; then
    cd $APP_MOUNT/services/client
  else
    echo "Client: Hello!"
  fi
}

function service-rails(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

  if [ -z "$1" ]; then
    cd $APP_MOUNT/services/rails
  else
    echo "Rails: Hello!"
  fi
}

function service-mercury(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

  if [ -z "$1" ]; then
    cd $APP_MOUNT/services/mercury
  else
    echo "Mercury: Hello!"
  fi
}
