#!/bin/zsh

function input-mouse-decel(){
  xinput -set-prop "Apple Magic Mouse" "Device Accel Constant Deceleration" $@
}


