platform=$(uname)
export DOCKER_HOST=localhost:2375


export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"

if [[ "$platform" == 'Linux' ]]; then
  GYP_GENERATORS="ninja"
  export HOME_DIR=${HOME}
  # export GYP_DEFINES="skia_shared_lib=1"

elif [[ "$platform" == 'Darwin' ]]; then
  export HOME_DIR=${HOME}
  # GYP_GENERATORS="ninja,xcode"
  # GYP_DEFINES="skia_os=mac skia_arch_width=64 skia_shared_lib=1"

  export PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library
else
  export HOME_DIR=${HOME}
fi

export FLUTTER_SDK=${HOME_DIR}/Developer/sdk/flutter
export PATH=$PATH:$FLUTTER_SDK/bin

export GOPATH=~/go
export EDITOR=vim

export DEVELOPER_HOME=$HOME_DIR/Developer

# export RUST_SRC_PATH=$HOME_DIR/Developer/ext/rust/src

if [[ "$platform" == 'Linux' ]]; then
  export JDK_HOME=/usr/lib/jvm/default-java
  export JAVA_HOME=/usr/lib/jvm/default-java

elif [[ "$platform" == 'Darwin' ]]; then
  CASK_JDK="/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home"
  export JAVA_HOME=$CASK_JDK
  export JDK_HOME=$CASK_JDK
  export PATH=$PATH:$CASK_JDK/bin

  function xclip() {
    pbcopy $@
  }
fi

export CLOJURESCRIPT_HOME=$DEVELOPER_HOME/sdk/clojurescript-vanilla

export LA=/Users/bailey/Library/LaunchAgents
# export EMACS_SERVER_FILE=/var/run/emacs.sock

# export DISPLAY=:0

if [ -f ~/.env ]; then
  source ~/.env;
fi


export PATH=$PATH:/usr/local/bundle/ruby/1.9.1/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


alias envsup='source ~/.env'
