# Crowdist Functions

CROWDIST_ROOT=~/Developer/work/crowdist/barge

function crowdist_bash(){
  export BARGE_ROOT=$CROWDIST_ROOT;
  source /home/bailey/Developer/work/crowdist/barge/lib/bash/src/base.sh;
}

crowd_barge = function() {
  cd ~/Developer/work/crowdist/barge;
  $@
}

crowd_compose = function() {
  vim ~/Developer/work/crowdist/barge/vault/compose/docker-compose.yml;
}

crowd_env = function(){
  vim ~/Developer/work/crowdist/barge/vault/env;
}

alias crowd_src_build='vim /barge/lib/bash/src/build.sh'
alias crowd_src_build_interface='vim /barge/bin/build_interface.sh'
alias crowd_src_app='vim /barge/lib/bash/src/app.sh'

alias crowd='crowdist'
alias cr='crowdist'
alias c='crowdist'

alias cstat='crowdist status'

alias crb='crowdist_bash'


alias cb='crowd_barge'

alias cs_reducer='crowd_barge; cd services/reducer'

alias cs_os='crowd_barge; cd systems/os'

alias csl='crowd_barge;   cd lib; ls'
alias css='crowd_barge;   cd services; ls'
alias csss='css'
alias cssss='css'

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
