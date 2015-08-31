function deploy-hubify(){
  git push heroku-staging master &
  git push heroku master
  git push origin master
}


