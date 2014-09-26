#!/bin/zsh

alias vim="stty stop '' -ixoff; vim"
alias vim-bundles='cd ~/.vim/bundle'
alias vadd='vim-add'
alias vlist='vim-list'
alias vs='vim-search'

alias vkeys='vim ~/.vim/keys.vim'

function vim-add() {
    pushd ~/.dot > /dev/null
    local repo=$1
    local name=$(echo $repo | sed -e 's/git:\/\/.*\///' | sed 's/https:\/\/.*\///' | sed 's/\.git//'  )

    echo "Installing Vim Bundle: $name [Enter]";
    read proceed;

    git submodule add $repo ./vim/bundle/$name
    popd
}

function vim-list(){
    ls ~/.dot/vim/bundle
}

function vim-search(){
  local term=$1
  if [[ -z "$term" ]]; then clr_red "No search term was provided"; return; fi;
  vim -c ":vim $term **/* | cw"
}
