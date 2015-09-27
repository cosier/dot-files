function dns-connect(){
  server=$1
  if [ -z "$server" ]; then
    server=8.8.8.8
  fi

  echo "Using DNS Server: $server"

  sudo iodine -r -I1 -P nemrymvi -TA -f $server iodine.cosier.ca
}

function dns-server(){
  sudo iodined -c -P nemrymvi -f 10.0.0.1 iodine.cosier.ca
}
