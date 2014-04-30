

function artisan(){
  ROOT=$(git rev-parse --show-toplevel)
  art=$ROOT/uploaderapp/artisan
  php $art $@
}


function cachi-db-reset(){
  artisan migrate:reset
  artisan migrate
  artisan migrate --package=Toddish/Verify
  artisan db:seed --class=VerifyUserSeeder
  artisan db:seed
}


