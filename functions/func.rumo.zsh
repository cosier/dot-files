alias rumo-debug='RUST_LOG="rumo=debug" ~/Developer/work/rumo/target/debug/rumo'

function rumo-build() {
  echo "Building rumo"
  curr=$(pwd)
  cd ~/Developer/work/rumo
  cargo build --quiet $@
  success=$?
  cd $curr
  return $success
}

function rumo-clean() {
  echo "Cleaning rumo"
  curr=$(pwd)
  cd ~/Developer/work/rumo
  shell_file=target/android-shell.zip
  if [ -f $shell_file ]; then
    rm $shell_file
  fi

  touch build.rs
  clean_dir=~/Developer/ext/rumo-example/target/android-shell

  if [ -d $clean_dir ]; then
    rm -rf $clean_dir
  fi

  success=$?
  cd $curr
  return $success
}

function rumo-example-build() {
  echo "Building rumo-example"
  curr=$(pwd)
  cd ~/Developer/ext/rumo-example
  rumo-debug build $@
  success=$?
  cd $curr
  return $success
}

# Shortcut for a fresh rumo.zsh command
alias rumu='clear; source ~/.dot/functions/func.rumo.zsh'

# Direct access to a rumo debug build
alias rumd='rumu; rumo-build && rumo-debug'

# Run a rumo-build followed by building an example
alias rumex='rumu; rumo-build && rumo-example-build'

# Run a clean rumo-build followed by building an example
alias rumex-fresh='rumu; rumo-clean && rumo-build && rumo-example-build'
