#!/bin/zsh

# ################################
# Filesystem "Places" Shortcut Directory
# ################################

function work_path(){
  #echo "[work_path] looking up $@"
  if [ -d "${HOME}/Developer/work/$@" ]; then
    cd ${HOME}/Developer/work/$@
  elif [ -d "${HOME}/Developer/ext/$@" ]; then
    cd ${HOME}/Developer/ext/$@
  elif [ -d "${HOME}/$@" ]; then
    cd $HOME/$@
  fi
}

alias wp='work_path'

alias emd='cd ~/.emacs.d'
alias emv='emd'

alias docs='cd ~/Documents'

alias logga='work_path logga'
alias lga='logga; cd app;'
alias lgw='logga; cd web;'

alias alli='work; cd alliance;'

alias tflo='work; cd trackflo;'
alias tflod='work; cd trackflo/desktop;'

alias go-rum='work_path rumo'
alias go-rume='cd ~/Developer/ext/rumo-example'
alias go-demo='work_path rumo/examples/demo'

alias go-studio='work_path openstudios'
alias studio='go-studio'

alias trai='work_path timbre; cd timbre-rails'
alias tde='work_path timbre; cd timbre-desktop'

alias lens='work_path lens_culture'
alias lci='work_path lc-imaging'
alias lcc='work_path lc-cloud'
alias lcw='work_path lc-worker'


alias mrbigboss='work_path mrbigboss'
alias mbb='mrbigboss'


alias go-dm='work_path dimappio'
alias dm='go-dm'

alias go-dr='work_path dr3030'
alias dr='go-dr'

alias go-fii='work_path factorii'
alias fii='go-fii'

alias go-cast='cd ~/Developer/ext/cast'
alias cast='go-cast'

alias go-ubelt='work_path ubelt'
alias gub='go-ubelt'

alias up-places='source ~/.dot/places.zsh'
alias palaces='places'
alias placels='places'

alias desk='cd ~/Desktop'
alias dek='desk'
alias deks='desk'
alias dks='desk'
alias dk='desk'

alias beats='cd ~/Desktop/beats'

alias apps='cd /apps';

alias dev='cd ~/Developer/'
alias ext='cd ~/Developer/ext'

alias music='cd ~/Music'

alias key='work_path keyport'

alias study='work_path studybloc/demo'

alias t1='work_path t1'
alias servo='ext-rust; cd servo;'
alias duk='work_path duktape-rs'

alias coach='work; cd coachbase;'
alias flare='work; cd flare'

# Dojo
alias dojo='work_path dojo'
alias tata='work_path dojo/tatami'
alias ori='work_path dojo/origami'

# Beetflo
alias bf='work_path beetflo'
alias bfa='work_path beetflo/api'
alias bfw='work_path beetflo/web'
alias flo='work_path beetflo/app'
alias flod='work_path beetflo/design'

# Narratia
alias na='work_path narratia/app'

alias toshokan='work_path toshokan'

# Crowdist
alias comm='work_path commando'
alias com='work_path commando'
alias cm='work_path commando'

# Prime zone
alias tmkf='work_path tmkf'

# General Work
alias work='cd ~/Developer/work'
alias tm='work_path timbrelog'
alias mvp='work_path timbrelog/mvp'
alias nt='work_path timbrelog/native'
alias native='work_path timbrelog/native'

alias bf='work_path beetflo/app'
alias bt='work_path bidontask'
alias co='work_path cosier'
alias coc='work_path cosier/client'

alias tfdash='work_path tfdash'
alias tfcms='work_path tfcms'
alias tf='tfdash'

alias tuloko='work_path tuloko-rails'
alias tk='tuloko'

alias market='work_path marketstraddle'
alias mk='market'

alias earbook='work_path earbook'
alias eb='earbook'
