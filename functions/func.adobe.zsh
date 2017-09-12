function adobe_kill() {
  ps aux | grep -i adobe | awk '{ print $2 }' | sudo xargs kill -9
}
