function pdump(){
  pg_dump -Fc --no-acl --no-owner -h localhost -p $1 -U docker postgres > latest.dump
}

function prestore(){
  pg_restore --verbose --clean --no-acl --no-owner -h localhost -p $1 -U docker -d postgres latest.dump
}

function psql-local(){
  psql -p 7777 -U vopsy -h localhost $@
}
