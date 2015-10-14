function tmkf-build(){
  initial=($(pwd))
  tmkf; bin/build.sh $@;
  cd $initial;
}

function tmkf-run(){
  initial=($(pwd))
  tmkf;
  bin/run.sh $@;
  cd $initial;
}

function tmkf-clean(){
  initial=($(pwd))
  tmkf;
  mkdir -p build/tmp
  rm -rf build/tmp
  echo "Cleaned $(pwd)/build/tmp"
  cd $initial;
}

alias tb='source ~/.dot/functions/func.tmkf.zsh; tmkf-build'
alias tg='source ~/.dot/functions/func.tmkf.zsh; tmkf-run'
alias tc='source ~/.dot/functions/func.tmkf.zsh; tmkf-clean'
