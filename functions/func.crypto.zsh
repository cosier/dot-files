#!/bin/zsh

#####################################
# AES Encrypt/Decrypt helpers

enc(){
    echo $1 | aespipe -P ~/.pass | base64
}

dec(){
   base64 -D $1 | aespipe -d -P ~/.pass
}
