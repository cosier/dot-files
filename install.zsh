#!/bin/zsh

cd ~/.dot

# Dependency management
git submodule update --init --recursive


# Clean dst folders
rm -rf ~/.emacs.d

if [[ -f "~/.vim" ]]; then
    rm -rf ~/.vim.old
    mv ~/.vim ~/.vim.old
fi

# Install/overwrite new symlinks

ln -sf ~/.dot/zshrc ~/.zshrc
ln -sf ~/.dot/zprofile.zsh ~/.zprofile
ln -sf ~/.dot/vimrc ~/.vimrc

ln -sf ~/.dot/cmus ~/.cmus
ln -sf ~/.dot/tmux.conf ~/.tmux.conf

ln -sf ~/.dot/netrc ~/.netrc
#ln -sf ~/.dot/pgpass ~/.pgpass

ln -sf ~/.dot/irssi ~/.irssi
ln -sf ~/.dot/dotemacs ~/.emacs.d

ln -sf ~/.dot/vim ~/.vim
ln -sf ~/.dot/hosts ~/.hosts
#ln -sf ~/.dot/xmodmap.rc ~/.Xmodmap

mkdir -p ~/.ssh
cp ~/.dot/ssh/* ~/.ssh/
cp ~/.dot/tmux/default_theme.sh ~/.dot/tmux/powerline/themes/default.sh

chmod 700 ~/.ssh
chmod 600 ~/.ssh/*
#chmod 600 ~/.pgpass
