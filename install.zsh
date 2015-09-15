#!/bin/zsh

cd ~/.dot

# Dependency management
#git submodule update --init --recursive



# Install/overwrite new symlinks
#ln -sf ~/.dot/tmux.conf ~/.tmux.conf

ln -sf ~/.dot/netrc ~/.netrc
#ln -sf ~/.dot/pgpass ~/.pgpass

ln -sf ~/.dot/irssi ~/.irssi

touch ~/.etchosts
rm ~/.etchosts
ln -sf ~/.dot/hosts ~/.etchosts

#ln -sf ~/.dot/xmodmap.rc ~/.Xmodmap

mkdir -p ~/.ssh
cp ~/.dot/ssh/* ~/.ssh/
#cp ~/.dot/tmux/default_theme.sh ~/.dot/tmux/powerline/themes/default.sh

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
#chmod 600 ~/.pgpass
