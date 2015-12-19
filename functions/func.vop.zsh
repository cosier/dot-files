function vop-db(){
  export DATABASE_URL='postgres://vop:hamster!$007@localhost:5432/vop_dev'
}

function build-vop(){
  TARGET=vop; $1
  if [ -d $TARGET ]; then
    docker build -t tutum.co/vopsy/$1 vop; $1
  else
    echo "Unable to build: $TARGET"
  fi
}

alias bv='build-vop'
alias v='vmp'
alias zenv='vop; zen'
alias zenvp='zen vop; puma'

alias vc='vcprod'
alias vcprod='vop; bin/compose.production.sh'
alias vcdev='vop; bin/compose.development.sh'

alias metal='vop; bin/start.metal.sh'
alias vs='vop; bin/start.sh'
alias vp='vop; bin/start.production.sh'
alias vmstart='vop; bin/start.manual.sh'
alias vmstop='vop; bin/stop.manual.sh'
