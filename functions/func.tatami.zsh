#!/bin/zsh


alias build-skia='/Developer/dojopad/tatami/support/builders/build_skia.sh'
alias build-tatami='/Developer/dojopad/tatami/support/builders/build_tatami.sh'

function btt(){
  build-tatami $@
}
