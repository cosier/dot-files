#!/bin/zsh

function hosts-inject(){
  echo "Injecting Host configuration"
  sudo -v
  tmp=$(mktemp /tmp/hosts.XXXX)
  tmp2=$(mktemp /tmp/hosts.XXXX)

  if [[ -z ~/.etchosts ]]; then
    echo "~/.etchosts file non-existant"
  else
    sudo cp /etc/hosts $tmp
    cat ~/.etchosts >> $tmp
    cat $tmp | sort -u > $tmp2

    sudo mv $tmp2 /etc/hosts
    rm $tmp
    echo "Updated hosts file"
  fi
}

function hosts-edit(){
  vim ~/.etchosts
  hosts-inject
}

