#!/bin/zsh

function hosts-inject(){
  echo "Injecting Host configuration"
  sudo -v
  tmp=$(mktemp)
  tmp2=$(mktemp)

  if [[ -z ~/.hosts ]]; then
    echo "~/.hosts file non-existant"
  else
    sudo cp /etc/hosts $tmp
    cat ~/.hosts >> $tmp
    cat $tmp | sort -u > $tmp2

    sudo mv $tmp2 /etc/hosts
    rm $tmp
    echo "Updated hosts file"
  fi
}

function hosts-edit(){
  vim ~/.hosts
  hosts-inject
}

