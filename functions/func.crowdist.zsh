# Crowdist Functions

CROWDIST_ROOT=/barge;

function crowdist_bash(){
  export BARGE_ROOT=$CROWDIST_ROOT;
  source $CROWDIST_ROOT/systems/os/lib/bash/src/base.sh;
}

crowd_barge = function() {
  if [[ "$CROWDIST_ROOT" != "" ]]; then
    echo -e "CROWDIST_ROOT: $CROWDIST_ROOT"
    cd $CROWDIST_ROOT;
    $@
  else

    echo -e "Using fake /barge due to missing CROWDIST_ROOT"
    cd /barge
    $@
  fi
}

crowd_env = function(){
  s=$1
  env=$2

  if [ -z "$env" ]]; then
    env="development"
  fi

  if [[ "$s" != "" ]]; then
    vim $CROWDIST_ROOT/vault/env/$s/$env.env;
  fi
}

crowd_services = function(){
  sv=$1
  sr=$CROWDIST_ROOT/services
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

crowd_libs = function(){
  lib=$1
  cd $CROWDIST_ROOT/systems/os/lib/${lib}*
}

crowd_compose = function(){
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

  main_file=$CROWDIST_ROOT/vault/compose/docker-compose.yml;

  if [ -z "$lib" ]; then
    echo "lib:$lib not found"
    vim $main_file

  else
    lib_file="$CROWDIST_ROOT/vault/compose/includes/_${lib}.yml";
    echo "lib:$lib_file"

    if [ -f $lib_file ]; then
      vim $lib_file
    else
      vim $main_file
    fi
  fi
}

alias crowd_src_build='vim $CROWDIST_ROOT/lib/bash/src/build.sh'
alias crowd_src_build_interface='vim $CROWDIST_ROOT/bin/build_interface.sh'
alias crowd_src_app='vim $CROWDIST_ROOT/lib/bash/src/app.sh'

alias crowd='crowdist'
alias c='crowdist'
alias cf='COMPOSE_FRESH=true crowdist'

alias cstat='crowdist status'

alias crb='crowdist_bash'


alias cb='crowd_barge'
alias cv='crowd_barge; cd vault'

alias cs_reducer='crowd_barge; cd services/reducer'

alias os='crowd_barge; cd systems/os'

alias cl='crowd_barge;   cd lib; ls'
alias clb='crowd_barge; cd lib/bash; ls'
alias cll='crowd_barge; cd lib/lua; ls'

alias cs='source ~/.dot/functions/func.crowdist.zsh; crowd_services'

alias csd='crowd_services doorman; ls'
alias csr='crowd_services reducer; ls'

alias crowdist_apx='ssh crow@apx.crowdist.com crowdist -C'


function test_crowdist_expand_includes(){
  crowdist_bash
  cat $BARGE_ROOT/vault/compose/docker-compose.yml | expand_includes
}

function test_crowdist_compile_config(){
  crowdist_bash
  cat $BARGE_ROOT/vault/compose/docker-compose.yml | compile_config
}

function test_crowdist(){
  crowdist_bash
  cat $BARGE_ROOT/vault/compose/docker-compose.yml | expand_includes | compile_config
}
