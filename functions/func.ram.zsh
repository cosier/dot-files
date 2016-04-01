function ram-disk-me(){
  echo "Creating Ramdisk: $size"

}

function ram-create-dev(){
  if [[ -z "$2" ]]; then
    echo "No size MB given as first param :<"
    return;
  fi
  if [[ -z "$2" ]]; then
    echo "No Name given as second param :<"
    return;
  fi


  MB=$2
  size=$(( $MB * 2097 ))

  mount="/ram/$2"

  ramfs_size_sectors=$((${MB}*1024*1024/512))
  ramdisk_dev=$(hdid -nomount ram://${ramfs_size_sectors})
  echo $ramdisk_dev
}

function ram-create-fs(){
  name=$1
  disk=$2

  # echo "Name: $1 on $disk"
  fs_cmd="/sbin/newfs_hfs -v 'ram-${name}' /dev/${2}"

  echo "$fs_cmd"
  echo "$fs_cmd" | pbcopy
  # $fs_cmd
}

function ram-mount(){
  disk=$1
  mount=$2
  echo "Mounting $disk at $mount"
  mount -o noatime -t hfs /dev/$disk $mount
}

function ram-cleanup(){
  sudo diskutil unmountDisk force /dev/$1
  diskutil eject /dev/$1
}

alias ram='source ~/.dot/functions/func.ram.zsh; ram-disk-me'

