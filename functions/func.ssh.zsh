#!/bin/zsh


alias ssh-uzzy='ssh bailey@uzzy -C'

alias ssh-longtail='ssh -C -v root@longtailapps.com'
alias ssh-longtail-mosh='mosh --ssh="ssh -v" deploy@longtailapps.com'

alias ssh-ezcontacts='ssh deploy@ezdev -v -i ~/.ssh/ezcontacts.pem -C'
alias ssh-ezcontacts-mosh='mosh --ssh="ssh -v -i ~/.ssh/ezcontacts.pem" ubuntu@ezdev'

alias ssh-wearmytags-old='ssh -v -i ~/.ssh/wearmytags.pem ec2-user@54.254.213.7'
alias ssh-wearmytags-mosh='mosh --ssh="ssh -v -i ~/.ssh/wmt-app-server.pem" ubuntu@54.183.32.55'

alias ssh-wearmytags='ssh -v -i ~/.ssh/wmt-app-server.pem ubuntu@54.183.32.55'
alias ssh-wearmytags-ubuntu='ssh ubuntu@staging.wearmytags.com -i ~/.ssh/wmt-app-server.pem'

alias ssh-dinecart='ssh bailey@dinecart.com -C'
alias ssh-streem-julia='ssh -p 21212 deploy@julia.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-malcolm='ssh -p 21212 deploy@malcolm.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-joe='ssh -p 21212 deploy@joe.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-joe-mosh='mosh --ssh="ssh -p 21212" deploy@joe.streem.com.au' #Q1IWxl/=o89GY68

alias ssh-streem-tony='ssh -p 21212 deploy@tony.streem.com.au -v -C' #Q1IWxl/=o89GY68
alias ssh-streem-tony-mosh='mosh --ssh="ssh -p 21212" deploy@tony.streem.com.au' #Q1IWxl/=o89GY68

alias ssh-smartdorks='ssh ubuntu@smartdorks.com -v -i ~/.ssh/smartdorks.pem -C'
alias ssh-troxy='ssh ubuntu@troxy.com -v -i ~/.ssh/smartdorks.pem -C'
#alias ssh-proxy-troxy='ssh ubuntu@troxy.com -v -i ~/.ssh/smartdorks.pem -C -D8192'

alias ssh-troxy='mosh --ssh="ssh -v -i ~/.ssh/smartdorks.pem" ubuntu@troxy.com'

alias ssh-bullet='ssh -C -v -i ~/.ssh/bulletpoints.pem root@bulletpoints.com.au'
alias ssh-hob='ssh -C -v ubuntu@houseofbargains.co.uk -i ~/.ssh/hob.pem'
alias ssh-enngraved='ssh ubuntu@direct.enngraved.com -v -i ~/.ssh/enngraved.pem -C'
alias ssh-enngraved-mosh='mosh --ssh="ssh -v -i ~/.ssh/enngraved.pem" ubuntu@direct.enngraved.com'

alias ssh-studybloc='ssh -C -v ubuntu@studybloc.org -i ~/.ssh/studybloc.pem'

function ssh-tunnel(){
  remote_port=6969
  local_port=80
  target="bailey@direct.vza.ca"
  ssh -R $remote_port:0.0.0.0:$local_port $target -C -v
}
