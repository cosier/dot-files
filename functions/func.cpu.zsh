function cpu_low(){
  #sudo cpufreq-set -c 1 -d 1200000
}

function cpu_max(){
 #sudo cpufreq-set -c 1 -d 2200000
}

function cpu_power(){
  echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}
function cpu_powersave(){
  echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
}

function cpu_power_check() {
  cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
}
