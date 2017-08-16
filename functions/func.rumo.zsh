alias rumo-debug='RUST_LOG="rumo=debug" ~/Developer/work/rumo/target/debug/rumo'

function rumo-build() {
  echo "Building rumo"
  curr=$(pwd)
  cd ~/Developer/work/rumo
  cargo build --quiet
  success=$?
  cd $curr
  return $success
}

function rumo-clean() {
  echo "Cleaning rumo"
  curr=$(pwd)
  cd ~/Developer/work/rumo
  rm -rf target/android-shell.zip
  touch build.rs
  rm -rf ~/Developer/ext/rumo-example/target/android-shell
  success=$?
  cd $curr
  return $success
}

function rumo-example-build() {
  echo "Building rumo-example"
  curr=$(pwd)
  cd ~/Developer/ext/rumo-example
  rumo-debug build
  success=$?
  cd $curr
  return $success
}


alias rumd='source ~/.dot/functions/func.rumo.zsh; rumo-build && rumo-debug'
alias rume='clear; source ~/.dot/functions/func.rumo.zsh; rumo-clean && rumo-build && rumo-example-build'
alias rumq='clear; source ~/.dot/functions/func.rumo.zsh; rumo-build && rumo-example-build'
