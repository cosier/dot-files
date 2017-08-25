#!/bin/zsh

cd ~/.dot

# Dependency management

# Install/overwrite new symlinks
if [ ! -f ~/.netrc ]; then
  ln -sf ~/.dot/netrc ~/.netrc
fi

if [ ! -f ~/.irssi ]; then
  ln -sf ~/.dot/irssi ~/.irssi
fi

ln -sf ~/.dot/spacemacs.emacs ~/.spacemacs
ln -sf ~/.dot/hosts ~/.etchosts

#ln -sf ~/.dot/xmodmap.rc ~/.Xmodmap

