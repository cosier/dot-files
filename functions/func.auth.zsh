if [ -f ~/.ssh/keys.zsh ]; then
  source ~/.ssh/keys.zsh
fi

alias dot-keys='vim ~/.ssh/keys.zsh; source ~/.ssh/keys.zsh'
