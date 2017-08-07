function shell-build() {
  /home/bailey/Developer/work/droid/shell/bin/build.sh $@
}

alias build-shell='shell-build'

function shell-apk() {
  cd /home/bailey/Developer/work/droid/shell/app/build/outputs/apk/
}

function shell() {
  cd /home/bailey/Developer/work/droid/shell
}

function hello() {
  cd /home/bailey/Developer/work/droid/examples/hello
}
