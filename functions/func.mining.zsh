#!/bin/bash


function mine-it(){
  echo "Mining with bywda.${worker}"
  minerd --url=stratum+tcp://pool.d2.cc:3336 --userpass bywda.console:x $@
}


function mine-with(){
  $1 --url=stratum+tcp://pool.d2.cc:3336 --userpass bywda.$2:x $3
}

