function tunnel_imoto() {
  autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 3333:localhost:80 dx.imoto.cosier.ca -CNTv
}

function tunnel_os_alpha() {
  autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 6000:localhost:5000 deploy@dx.openstudios.in -NTv
}

function tunnel_os_dev() {
  autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -R 5000:localhost:80 deploy@dx.openstudios.in -NTv
}

