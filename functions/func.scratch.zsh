function shell-build() {
  /home/bailey/Developer/work/kinito/shell/bin/build.sh $@
}

alias build-shell='shell-build'

function shell-apk() {
  cd /home/bailey/Developer/work/kinito/shell/app/build/outputs/apk/
}

function shell() {
  cd /home/bailey/Developer/work/kinito/shell
}

function hello() {
  cd /home/bailey/Developer/work/kinito/examples/hello
}
