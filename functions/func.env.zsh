function env-reload(){
  sed 's/^/export /' /etc/environment > /tmp/env.sh
  source /tmp/env.sh > /dev/null
  echo 'Environment Reloaded :}'
  rm /tmp/env.sh
}
