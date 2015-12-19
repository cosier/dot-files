platform=$(uname)
if [[ "$platform" == 'Linux' ]]; then
  GYP_GENERATORS="ninja"
  export HOME_DIR=/home/ubuntu
  export GYP_DEFINES="skia_shared_lib=1"

elif [[ "$platform" == 'Darwin' ]]; then
  export HOME_DIR=/Users/bailey
  GYP_GENERATORS="ninja,xcode"
  GYP_DEFINES="skia_os=mac skia_arch_width=64 skia_shared_lib=1"
else
  export HOME_DIR=/home/ubuntu
fi

export LAPIS_OPENRESTY=$(which openresty)
export GOPATH=~/go
export EDITOR=vim

export DEVELOPER_HOME=$HOME_DIR/Developer

# export RUST_SRC_PATH=$HOME_DIR/Developer/ext/rust/src

if [[ "$platform" == 'Linux' ]]; then
  export JDK_HOME=/usr/lib/jvm/default-java
  export JAVA_HOME=/usr/lib/jvm/default-java
elif [[ "$platform" == 'Darwin' ]]; then
  export JAVA_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
  export JDK_HOME=/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home
  export PATH=$PATH:/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin
fi

export CLOJURESCRIPT_HOME=$DEVELOPER_HOME/sdk/clojurescript-vanilla

export LA=/Users/bailey/Library/LaunchAgents

# export DATABASE_URL=postgres://docker:michigan\!\$007@localhost:5432/postgres


platform=`uname`
if [[ $platform == "Darwin" ]]; then
    osx='yes'
else
    linux='yes'
fi

export RAILS_ENV=development

