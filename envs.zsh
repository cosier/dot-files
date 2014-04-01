platform=$(uname)
if [[ "$platform" == 'Linux' ]]; then
  export HOME_DIR=/home/ubuntu
elif [[ "$platform" == 'Darwin' ]]; then
  export HOME_DIR=/Users/bailey
else
  export HOME_DIR=/home/ubuntu
fi



export DEVELOPER_HOME=$HOME_DIR/Developer

export JDK_HOME=/usr/lib/jvm/default-java
export JAVA_HOME=/usr/lib/jvm/default-java

export CLOJURESCRIPT_HOME=$DEVELOPER_HOME/sdk/clojurescript-vanilla

export LA=/Users/bailey/Library/LaunchAgents


platform=`uname`
if [[ $platform == "Darwin" ]]; then
    osx='yes'
else
    linux='yes'
fi

