alias rumo-debug='RUST_LOG="rumo=debug" ~/Developer/work/rumo/target/debug/rumo'

function rumo-build() {
  curr=$(pwd)
  cd ~/Developer/work/rumo
  cargo build
  success=$?
  cd $curr
  echo
  return $success
}
