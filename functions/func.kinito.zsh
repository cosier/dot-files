alias kinito-debug='RUST_LOG="kinito=debug" ~/Developer/work/kinito/target/debug/kinito'

function kinito-build() {
  curr=$(pwd)
  cd ~/Developer/work/kinito
  cargo build
  success=$?
  cd $curr
  echo
  return $success
}

alias kd='kinito-debug'
alias kb='kinito-build'
