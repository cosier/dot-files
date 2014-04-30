#!/bin/zsh

alias ssh-vps='ssh bailey@vps.vza.ca -C'

alias ssh-uzzy='ssh bailey@uzzy -C'

alias ssh-ezcontacts='ssh deploy@ezdev -v -i ~/.ssh/id_rsa -C'
alias ssh-ezcontacts-mosh='mosh --ssh="ssh -v -i ~/.ssh/ezcontacts.pem" ubuntu@ezdev'

alias ssh-dinecart='ssh bailey@dinecart.com -C'
alias ssh-streem-julia='ssh -p 21212 deploy@julia.streem.com.au -v -C' #Q1IWxl/=o89GY68

alias ssh-smartdorks='ssh ubuntu@smartdorks.com -v -i ~/.ssh/smartdorks.pem -C'
alias ssh-troxy='ssh ubuntu@troxy.com -v -i ~/.ssh/smartdorks.pem -C'
alias ssh-proxy-troxy='ssh ubuntu@troxy.com -v -i ~/.ssh/smartdorks.pem -C -D8192'

alias ssh-troxy='mosh --ssh="ssh -v -i ~/.ssh/smartdorks.pem" ubuntu@troxy.com'

alias ssh-bullet='ssh -C -v -i ~/.ssh/bulletpoints.pem root@bulletpoints.com.au'
alias ssh-hob='ssh -C -v ubuntu@houseofbargains.co.uk -i ~/.ssh/hob.pem'
alias ssh-enngraved='ssh ubuntu@direct.enngraved.com -v -i ~/.ssh/enngraved.pem -C'

alias ssh-studybloc='ssh -C -v ubuntu@studybloc.org -i ~/.ssh/studybloc.pem'

function ssh-tunnel(){
  remote_port=6969
  local_port=80
  target="bailey@direct.vza.ca"
  ssh -R $remote_port:0.0.0.0:$local_port $target -C -v
}
