function buildc() {
  cur=$(pwd)
  git-root;

  if [ -f bin/clean.sh ]; then
    bin/clean.sh
  fi

  if [ -f bin/build.sh ]; then
    bin/build.sh
  fi

  cd $cur
}

function buildr() {
  cur=$(pwd)
  git-root;

  if [ -f bin/clean.sh ]; then
    bin/clean.sh
  fi

  if [ -f bin/build.sh ]; then
    bin/build.sh
  fi

  if [ -f bin/run.sh ]; then
    bin/run.sh $@
  fi

  cd $cur
}

function buildt() {
  cur=$(pwd)
  git-root;

  if [ -f bin/clean.sh ]; then
    bin/clean.sh
  fi

  if [ -f bin/build.sh ]; then
    bin/build.sh
  fi

  if [ -f bin/tests.sh ]; then
    bin/tests.sh $@
  fi

  cd $cur
}

function build() {
  cur=$(pwd)
  git-root;
  if [ -f bin/build.sh ]; then
    bin/build.sh
  fi
  cd $cur
}
