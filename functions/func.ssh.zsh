#!/bin/zsh

alias ssh-doug='ssh bailey@doug -v'
alias ssh-uzzy='ssh bailey@uzzy -C'

alias ssh-vps='ssh bailey@vps.cosier.ca -C -v'
alias ssh-vps-mosh='mosh bailey@vps.cosier.ca'

alias ssh-bidontask='ssh deploy@direct.bidontask.com -v -C'
alias ssh-bidontask-mosh='mosh deploy@direct.bidontask.com'

alias ssh-proxy-vps='autossh -M9092 bailey@vps.cosier.ca -c arcfour -D0.0.0.0:8192'
alias ssh-proxy-dc='ssh b2@dinecart.com -c arcfour -D8192'
alias ssh-proxy-longtail='ssh deploy@direct.longtailapps.com -c arcfour -D8192'
alias mt='mosh-turbo'
alias ssh-proxy-bidontask='ssh bailey@direct.bidontask.com -v -c arcfour -D8192'

alias ssh-longtail='ssh -C -v deploy@direct.longtailapps.com'
alias ssh-longtail-mosh='mosh --ssh="ssh -v" deploy@direct.longtailapps.com'

alias ssh-ezcontacts='ssh deploy@ezdev -v -i ~/.ssh/ezcontacts.pem -C'
alias ssh-ezcontacts-mosh='mosh --ssh="ssh -v -i ~/.ssh/ezcontacts.pem" ubuntu@ezdev'

alias ssh-wearmytags-prod='ssh -v -i ~/.ssh/wmt_frontend_nginx.pem deploy@wearmytags.com'
alias ssh-wearmytags-staging='ssh deploy@54.86.216.36 -i ~/.ssh/wmt_frontend_nginx.pem'
alias ssh-wearmytags-mosh-staging='mosh deploy@54.86.216.36'
alias ssh-wearmytags-mosh-prod='mosh deploy@wearmytags.com'

alias ssh-dinecart='ssh bailey@dinecart.com -C'
alias ssh-streem-julia='ssh -p 21212 deploy@julia.streem.com.au -v -C' #ustYRe9K
alias ssh-streem-malcolm='ssh -p 21212 deploy@malcolm.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-joe='ssh -p 21212 deploy@joe.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-joe-mosh='mosh --ssh="ssh -p 21212" deploy@joe.streem.com.au' #Q1IWxl/=o89GY68

alias ssh-streem-tony='ssh -p 21212 deploy@tony.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-tony-mosh='mosh --ssh="ssh -p 21212" deploy@tony.streem.com.au' #Q1IWxl/=o89GY68

alias ssh-smartdorks='ssh ubuntu@smartdorks.com -v -i ~/.ssh/smartdorks.pem -C'
alias ssh-troxy='ssh ubuntu@troxy.com -v -i ~/.ssh/smartdorks.pem -C'

alias ssh-troxy='mosh --ssh="ssh -v -i ~/.ssh/smartdorks.pem" ubuntu@troxy.com'

alias ssh-bullet='ssh -C -v -i ~/.ssh/bulletpoints.pem root@bulletpoints.com.au'
alias ssh-hob='ssh -C -v ubuntu@houseofbargains.co.uk -i ~/.ssh/hob.pem'
alias ssh-enngraved='ssh ubuntu@enngraved.com -v -i ~/.ssh/enngraved.pem -C'
alias ssh-enngraved-mosh='mosh --ssh="ssh -v -i ~/.ssh/enngraved.pem" ubuntu@direct.enngraved.com'

alias ssh-studybloc='ssh -C -v ubuntu@studybloc.org -i ~/.ssh/studybloc.pem'
alias ssh-prc='ssh -C -v deploy@studybloc.org -i ~/.ssh/studybloc.pem'

function ssh-tunnel(){
  remote_port=6969
  local_port=80
  target="bailey@direct.vza.ca"
  ssh -R $remote_port:0.0.0.0:$local_port $target -C -v
}
