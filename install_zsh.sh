#!/bin/bash

if [ -d "/home/bailey/.oh-my-zsh" ]; then
	ln -sf ~/.dot/baileys-magic.zsh-theme ~/.oh-my-zsh/themes/baileys-magic.zsh-theme
	ln -sf ~/.dot/zshrc ~/.zshrc
else
	sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


