#!/bin/zsh

cd ~/.dot

# Dependency management
#git submodule update --init --recursive



# Install/overwrite new symlinks
if [ ! -f ~/.tmux.conf ]; then
  ln -s ~/.dot/tmux.conf ~/.tmux.conf
fi

if [ ! -f ~/.netrc ]; then
  ln -sf ~/.dot/netrc ~/.netrc
fi

#ln -sf ~/.dot/pgpass ~/.pgpass

if [ ! -f ~/.irssi ]; then
  ln -sf ~/.dot/irssi ~/.irssi
fi

ln -sf ~/.dot/spacemacs/config ~/.spacemacs
ln -sf ~/.dot/hosts ~/.etchosts

#ln -sf ~/.dot/xmodmap.rc ~/.Xmodmap

mkdir -p ~/.ssh
cp ~/.dot/ssh/* ~/.ssh/

#cp ~/.dot/tmux/default_theme.sh ~/.dot/tmux/powerline/themes/default.sh

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

#chmod 600 ~/.pgpass
