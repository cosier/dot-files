function pdump(){
  PGPASSWORD=michigan!$007 pg_dump -Fc --no-acl --no-owner -h localhost -p $1 -U docker postgres > latest.dump
}
