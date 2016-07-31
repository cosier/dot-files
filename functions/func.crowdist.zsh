# Crowdist Functions

CROWDIST_ROOT=~/Developer/work/crowdist/barge

function crowdist_bash(){
  export BARGE_ROOT=$CROWDIST_ROOT;
  source /home/bailey/Developer/work/crowdist/barge/lib/bash/src/base.sh;
}

crowd_barge = function() {
  cd ~/Developer/work/crowdist/barge;
  if [ -n "$1" ]; then
    $@
  else
    ls
  fi
}

crowd_compose = function() {
  vim ~/Developer/work/crowdist/barge/vault/compose/docker-compose.yml;
}

crowd_env = function(){
  vim ~/Developer/work/crowdist/barge/vault/env;
}

alias crowd='crowdist'
alias cr='crowdist'
alias crb='crowdist_bash'


alias cb='crowd_barge'

alias cs_reducer='crowd_barge; cd services/reducer'

alias cs_os='crowd_go; cd systems/os'
alias csl='crowd_go; cd lib'
alias css='crowd_go; cd services'

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
