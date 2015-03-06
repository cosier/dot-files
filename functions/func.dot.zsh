#!/bin/zsh

#####################################
# DOT System

function dot-update(){
	~/.dot/update.zsh
	~/.dot/install.zsh
	source ~/.zshrc

  # Update VIM
  cd ~/.vim;
  git add .;
  git commit -m 'Auto update'
  git push origin master

  # Update TMUX
  cd ~/.tmux;
  git add .;
  git commit -m 'Auto update'
  git push origin master
}

function dot-install(){
    ~/.dot/install.zsh
}

function file-limits(){
    sudo sysctl -w kern.maxfilesperproc=18192
    sudo sysctl -w kern.maxfiles=65535
}
