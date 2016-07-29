# Crowdist Functions

crowd_go = function(){
  cd ~/Developer/work/crowdist/barge;
  if [ -n "$1" ]; then
    $@
  else
    ls
  fi
}

alias cs='crowd_go'

alias cs_reducer='crowd_go; cd services/reducer'
alias cs_reduce='cs_reducer'
alias cs_red='cs_reducer'
alias cs_r='cs_reducer'
alias cs_rr='cs_reducer'
alias cs_rr='cs_reducer'

alias cs_os='crowd_go; cd systems/os'

CROWDIST_ROOT=~/Developer/work/crowdist/barge

function crowdist_bash(){
  export BARGE_ROOT=$CROWDIST_ROOT;
  source /home/bailey/Developer/work/crowdist/barge/lib/bash/src/base.sh;
}
