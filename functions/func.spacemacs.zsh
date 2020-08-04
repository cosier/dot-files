function edit-spacemacs(){
  em ~/.spacemacs
}

function edit-bailey-macs(){
  vim ~/.dot/spacemacs/bailey/packages.el
}

function spacemacs-custom(){
  HOME=~/Developer/ext/spacemacs emacs -nw $@
}

alias space='spacemacs-custom'
