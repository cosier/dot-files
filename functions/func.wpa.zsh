export WETH="wlx000f005291d1"


function wpa_go() {
  echo "WETH: $WETH"
  export WETH=$WETH
  killall wpa_supplicant
  wpa_supplicant $@ -c ~/.dot/wpa/wpa_supplicant.conf -i$WETH
}

function wpa_run() {
  source ~/.dot/functions/func.wpa.zsh
  wpa_go
}
