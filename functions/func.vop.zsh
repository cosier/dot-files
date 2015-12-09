function vop-db(){
  export DATABASE_URL='postgres://vop:hamster!$007@localhost:5432/vop_dev'
}

function build-vop(){
  TARGET=~/Developer/work/vop/$1
  if [ -d $TARGET ]; then
    docker build -t tutum.co/vopsy/$1 ~/Developer/work/vop/$1
  else
    echo "Unable to build: $TARGET"
  fi
}

alias bv='build-vop'
alias v='vmp'
alias vs='~/Developer/work/vop/bin/start.sh'
# alias vp='~/Developer/work/vop/bin/start.production.sh'
alias vmstart='~/Developer/work/vop/bin/start.manual.sh'
alias vmstop='~/Developer/work/vop/bin/stop.manual.sh'
