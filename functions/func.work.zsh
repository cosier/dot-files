
alias door='service-doorman'
alias mrc='service-mercury'
alias vev='env-service'
alias vps='compose-service'


function mount-hubify(){
  export APP_MOUNT=/hubify
  mount-save
}

function mount-zune(){
  export APP_MOUNT=/zune
  mount-save
}

function mount-save(){
  echo "$APP_MOUNT" > ~/.app_mount
}

function mount-reload(){
  if [ -f ~/.app_mount ]; then
    export APP_MOUNT=$(cat ~/.app_mount)
  else
    export APP_MOUNT=/hubify
  fi
}

if [ -z "$APP_MOUNT" ]; then
  mount-reload
fi

function compose-service(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

  service=$1

  COMPOSE=$APP_MOUNT/vault/compose/includes/_$service.yml
  vim COMPOSE
}

function env-service(){
  if [ -z "$APP_MOUNT" ]; then
    APP_MOUNT=$APP_MOUNT
  fi

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
