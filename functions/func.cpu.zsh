function cpu_low(){
  sudo cpufreq-set -c 1 -d 1200000
}

function cpu_max(){
  sudo cpufreq-set -c 1 -d 2200000
}
