#!/bin/zsh


function spotlight-enable(){
  sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
}
function spotlight-disable(){
  sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
}

