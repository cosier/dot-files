function linux-clear-cache(){
  echo "echo 1 > /proc/sys/vm/drop_caches" | sudo sh
  echo "echo 2 > /proc/sys/vm/drop_caches" | sudo sh
  echo "echo 3 > /proc/sys/vm/drop_caches" | sudo sh
}
