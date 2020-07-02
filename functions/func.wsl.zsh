function wsl_ip(){
  tail -1 /etc/resolv.conf | cut -d' ' -f2
}

function wsl-services() {
  sudo service ssh start
  sudo service postgresql start
  sudo service redis-server start
  sudo service nginx restart
}
