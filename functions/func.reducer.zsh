function reducer_build(){
  COUNT=10

  if [ -n "$1" ]; then
    COUNT=$1
  fi

  while RES=$(inotifywait -e create $DIR --format %f .)
  do
    echo -e "\n\n-----------------------\n\n"
    cargo build 2>&1 | head -n10
    echo -e "\n"
  done
};

alias redbuild='source ~/.dot/funcs/reducer.func.zsh; reducer_build'
