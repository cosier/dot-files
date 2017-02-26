# Crowdist Functions

FOREST_ROOT=~/Developer/work/forestspider;
FOREST_CLOUDFLARE=e75d804edeabd92faf051daa438fff77e6985

function forest_bash(){
  export FOREST_ROOT=$FOREST_ROOT;
  source ~/.forest/cli/src/base.sh;
}

forest_barge = function() {
  if [[ "$FOREST_ROOT" != "" ]]; then
    echo -e "FOREST_ROOT: $FOREST_ROOT"
    cd $FOREST_ROOT;
    $@
  else

    echo -e "Using fake /barge due to missing FOREST_ROOT"
    cd /barge
    $@
  fi
}

forest_env = function(){
  s=$1
  env=$2

  if [ -z "$env" ]]; then
    env="development"
  fi

  if [[ "$s" != "" ]]; then
    vim $FOREST_ROOT/vault/env/$s/$env.env;
  fi
}

forest_services = function(){
  sv=$1
  sr=$FOREST_ROOT/services
  p=$sr/$sv
  if [ -d $p ]; then
    cd $p

  else
    result=$(ls $sr | grep -i $sv | head -n1)

    if [ -z "$result" ]; then
      ls $sr | grep $sv
      echo "$p -> no result $result" 1>&2
      return
    fi

    if [ -d $sr/$result ]; then
      cd $sr/$result;
    else
      echo -e "Could not find: $p at $sr"
      cd $sr
      return
    fi
  fi
}

forest_libs = function(){
  lib=$1
  cd $FOREST_ROOT/systems/os/lib/${lib}*
}

forest_compose = function(){
  lib=$1

  if [[ "$lib" == "door" ]] || \
     [[ "$lib" == "dm" ]] || \
     [[ "$lib" == "d" ]];
  then
    sv='doorman'
  fi

  if [[ "$lib" == "reduce" ]] || \
     [[ "$lib" == "red" ]] || \
     [[ "$lib" == "r" ]];
  then
    sv='reducer'
  fi

  main_file=$FOREST_ROOT/vault/compose/docker-compose.yml;

  if [ -z "$lib" ]; then
    echo "lib:$lib not found"
    vim $main_file

  else
    lib_file="$FOREST_ROOT/vault/compose/includes/_${lib}.yml";
    echo "lib:$lib_file"

    if [ -f $lib_file ]; then
      vim $lib_file
    else
      vim $main_file
    fi
  fi
}

alias forest_src_build='vim $FOREST_ROOT/lib/bash/src/build.sh'
alias forest_src_build_interface='vim $FOREST_ROOT/bin/build_interface.sh'
alias forest_src_app='vim $FOREST_ROOT/lib/bash/src/app.sh'

alias f='forest'
alias ff='COMPOSE_FRESH=true forest'

alias fstat='forestist status'

alias frb='forestist_bash'


alias fb='forest_barge'
alias fv='forest_barge; cd vault'

alias fs_reducer='forest_barge; cd services/reducer'

alias fos='forest_barge; cd systems/os'

alias fl='forest_barge;   cd lib; ls'
alias flb='forest_barge; cd lib/bash; ls'
alias fll='forest_barge; cd lib/lua; ls'

alias fs='source ~/.dot/functions/func.forestspider.zsh; forest_services'

alias fsd='forest_services doorman; ls'
alias fsr='forest_services reducer; ls'

alias forest_apx='ssh crow@apx.forestspider.com forest -C'


function test_forestist_expand_includes(){
  forest_bash
  cat $FOREST_ROOT/vault/compose/docker-compose.yml | expand_includes
}

function test_forestist_compile_config(){
  forest_bash
  cat $FOREST_ROOT/vault/compose/docker-compose.yml | compile_config
}

function test_forestist(){
  forest_bash
  cat $FOREST_ROOT/vault/compose/docker-compose.yml | expand_includes | compile_config
}
