function build(){
  before=$(pwd)
  cd ~/Developer/work/vop

  if [ -f bin/build.sh ]; then
    ROOT=$(git rev-parse --show-toplevel)
    sudo $ROOT/bin/build.sh $@
  else
    echo "Could not find build script: $(pwd)/bin/build.sh"
  fi

  cd $before
}

function deploy(){
  before=$(pwd)
  cd ~/Developer/work/vop

  if [ -f bin/deploy.sh ]; then
    ROOT=$(git rev-parse --show-toplevel)
    sudo $ROOT/bin/deploy.sh $@
  else
    echo "Could not find build script: $(pwd)/bin/deploy.sh"
  fi

  cd $before
}

function build_and_deploy(){
  target=$1
  build $target
  deploy $target
}

alias bad='build_and_deploy'
