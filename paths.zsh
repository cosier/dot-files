#!/bin/zsh

export WEBROOT=/var/www/dinecart/app/webroot
export DINE=/var/www/dinecart

# Add Android SDK Tools
PATH=$PATH:/Users/bailey/Developer/sdk/adt-bundle-mac-x86_64-20130729/sdk/tools

PATH=$PATH:/Users/bailey/Developer/qt/Qt5.2.0/5.2.0-rc1/clang_64/bin
PATH=$PATH:/Users/bailey/Developer/sdk/ignifuga/tools
#PATH=$PATH:/opt/java/current/bin
PATH=$PATH:/usr/local/src/depot_tools
PATH=$PATH:/usr/local/Cellar/depot/tools
PATH=$PATH:~/.dot/bin

PATH=$PATH:/usr/local/src/clojurescript/bin

PATH="/Applications/Postgres93.app/Contents/MacOS/bin:$PATH"


export PATH=$PATH
