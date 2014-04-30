
export SSD_PATH=/Volumes/Capsule

function ssd-on(){
  if [[ "$1" == "test" ]]; then
    echo "Running Test Dryrun"
    local options="-azv --delete -n"
  else
    echo "Hold on bro, this is for real"
    local options="-azv --delete"
  fi


  command="rsync $options $SSD_PATH/Developer ~/.Developer"
  echo "command: $command"

  #rsync $options ~/.Developer $SSD_PATH/Developer

  #ln -sf $SSD_PATH/Developer ~/Developer
  echo "SSD turned ON successfully"
}

function ssd-off(){
  if [[ "$1" == "test" ]]; then
    echo "Running Test Dryrun"
    local options="-azv --delete -n"
  else
    echo "Hold on bro, this is for real"
    local options="-azv --delete"
  fi

  command="rsync $options $SSD_PATH/Developer ~/.Developer"
  echo "command: $command"
  #ln -sf ~/.Developer ~/Developer
  echo "SSD turned OFF successfully"
}





