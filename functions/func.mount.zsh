#!/bin/zsh

function mount-get-binds(){
  echo "mount -o bind /proc /media/ssd/proc/"
  echo "mount -o bind /dev /media/ssd/dev/"
  echo "mount -o bind /sys /media/ssd/sys"
}


function mount-nfs-setup(){
    sudo mkdir -p /nfs/Developer
    sudo chown -R bailey:staff /nfs
}

function mount-developer() {
    sudo mount -t nfs -o resvport,rw vm.local:Developer /nfs/Developer
}

function mount-bidontask(){
  sshfs bailey@vbo.vza.ca:/home/bailey/Developer/work/bidontask ~/Developer/mounts/bidontask
}
function mount-vivo(){
  sshfs bailey@vbo.vza.ca:/home/bailey/Developer/work/vivo/backorders ~/Developer/mounts/vivo
}
