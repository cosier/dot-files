function ram-disk-me(){
  if [[ -z "$1" ]]; then
    echo "No name param given :<"
    return;
  fi

  if [[ -z "$2" ]]; then
    echo "No size param given :<"
    return
  fi

  name=$1
  MB=$2
  size=$(( $MB * 2097 ))
  echo "Creating Ramdisk: $size"

  diskutil erasevolume HFS+ $name `hdiutil attach -nomount ram://$size`

}

