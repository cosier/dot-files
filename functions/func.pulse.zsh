function pulse-loopback() {
  pactl load-module module-loopback latency_msec=1
}

function pulse-stop-loopback() {
  pactl unload-module module-loopback
}
