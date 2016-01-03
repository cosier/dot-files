function vm-ports(){
  VBoxManage modifyvm "virtual" --natpf1 "tcp-port80,tcp,,80,,80";
  VBoxManage modifyvm "virtual" --natpf1 "tcp-port3000,tcp,,3000,,3000";
  VBoxManage modifyvm "virtual" --natpf1 "tcp-port8989,tcp,,8989,,8989";
}

