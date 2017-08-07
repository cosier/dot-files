function shell-build() {
  /home/bailey/Developer/work/mobile-builder/shell/bin/build.sh $@
}

alias build-shell='shell-build'

function shell-apk() {
  cd /home/bailey/Developer/work/mobile-builder/shell/app/build/outputs/apk/
}

function shell() {
  cd /home/bailey/Developer/work/mobile-builder/shell
}

function hello() {
  cd /home/bailey/Developer/work/mobile-builder/examples/hello
}
