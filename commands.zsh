#!/bin/zsh

alias restart='sudo systemctl restart'
alias stop='sudo systemctl stop'
alias start='sudo systemctl start'

alias ey='eyeD3'
alias hosts='sudo vim /etc/hosts'
alias py='python'
alias xit='exit'

alias jj='sudo journalctl -f'

alias be='bundle exec'
alias google='links http://google.com/'
alias lg='app logs -f'
alias svim='sudo vim'
alias gs='git status'
alias ga='git add . -A'
alias git-root='ROOT="$(git rev-parse --show-toplevel)"; cd "$ROOT"'
alias gr='git-root'
alias got='git'
alias g='git'

alias rsync='rsync --progress --partial'

alias gw='./gradlew'

alias s='ls'

alias ns='nslookup'
alias emu='~/Android/Sdk/emulator/emulator'

alias exot='exit'
alias exlt='exit'
alias eit='exit'
alias ex='exit'


alias v='vim'
alias m='mpv --loop-file=1'

alias ngx_start='sudo nginx -c conf/nginx.conf'
alias ngx_stop='sudo nginx -c conf/nginx.conf -s stop'


alias fgo='forego'
alias fm='foreman'
alias rpc='gr; bin/rspec'

alias curl='noglob curl'
alias ksw='keyboard-swap-caps'

# alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

alias commands='vim ~/.dot/commands.zsh; source ~/.dot/commands.zsh'
alias refresh-commands='source ~/.dot/commands.zsh'
alias zshrc='vim ~/.zshrc; source ~/.zshrc'
alias funcs='vim ~/.dot/funcs.zsh; source ~/.dot/funcs.zsh'
alias places='vim ~/.dot/places.zsh; source ~/.dot/places.zsh'
alias paths='vim ~/.dot/paths.zsh; source ~/.dot/paths.zsh'
alias enviros='vim ~/.dot/envs.zsh; source ~/.dot/envs.zsh'
alias vimrc='vim ~/.vimrc'
alias tmuxrc='vim ~/.tmux.conf;tmux source-file ~/.tmux.conf'
alias wgetp='wget -c --password=mtvmasta --user bailey'
alias invert='xcalib -i -a'
alias clipboard='xclip -sel clipboard'
alias whereami='pwd'

alias ack='ack-grep'
#alias ls='ls --group-directories-first --color=always'
alias guake-dark='~/Developer/ext/guake-colors-solarized/set_dark.sh'
alias guake-light='~/Developer/ext/guake-colors-solarized/set_light.sh'

alias rsync='noglob rsync'
alias scp='noglob scp'
alias ssh='noglob ssh'

alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias air='airport'

alias size='du -hs '
alias sz='size'

# System Like I Like it
alias irc='irssi --config=~/.dot/irssi/config --home=~/.dot/irssi --connect=irc.freenode.net'

# Mountpoints
alias vps_mount='cd ~/tmp; mkdir -p vps_mount; sshfs bailey@str.shogun.ca:/home/bailey ~/tmp/vps_mount; cd vps_mount'

# Rust
alias cb='cargo test 2>&1 | less'
alias ccb='cb'
alias cbb='cb'
alias ccvv='cb'
alias cv='cb'

alias ca='cargo'

alias dns-cache-delete='sudo killall -HUP mDNSResponder'

alias aux='ps aux | grep'
alias font-cache='sudo fc-cache -fv'

alias iwant='sudo apt-get install -y'
alias up='sudo apt-get update'
alias upgrade='sudo apt-get upgrade'
alias icanhas='sudo apt-cache search'
alias aptpo='sudo apt-cache policy'
alias apt='sudo apt-add-repository'

alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

alias restart='sudo restart'
alias ng='aircrack-ng'

alias postgres-d='postgres -D /usr/local/var/postgres'

# PHP
alias fpm_start='sudo /usr/local/sbin/php-fpm --fpm-config /usr/local/etc/php/5.4/php-fpm.conf'
alias fpm_stop='sudo killall php-fpm'
alias fpm_restart='fpm_stop; fpm_start'

alias m_start='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
alias m_stop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist'
alias m_restart='m_stop; m_start'

alias phpcs='php-cs-fixer'
alias php-lint='GITROOT="$(git rev-parse --show-toplevel)"; $GITROOT/bin/codelint php'


# SSH
alias ssh-vm='ssh bailey@vm.local'
alias ssh-bot='mosh www-data@bidontask.com'
alias vps-mosh='mosh bailey@vps.cosier.ca'
alias update='git pull origin'

alias gitgo='git add . -A; git commit -m "working changes"; pos'
alias gcom="git add . -A; git commit -a -m"
alias rs='git reset --hard'



# Rails
alias rake_db_clean='rake db:drop db:create db:schema:load'

# Tmux
alias tfresh='tmux source-file ~/.tmux.conf'

# GIT
alias gitgo='GITROOT="$(git rev-parse --show-toplevel)"; git add . ; git commit -a -m "Automatic commit"'
alias gf='git flow'
# PHP

# alias console='GITROOT="$(git rev-parse --show-toplevel)"; $GITROOT/app/console'
alias db='dbase'
# System
alias trackpad-disable='xinput set-prop 17 "Device Enabled" 0'
alias trackpad-enable='xinput set-prop 17 "Device Enabled" 1'

alias timezone_ict='sudo systemsetup -settimezone Asia/Bangkok'
alias timezone_mst='sudo systemsetup -settimezone America/Edmonton'
alias timezone='sudo systemsetup -gettimezone'

alias desktop-osx-on='defaults write com.apple.finder CreateDesktop -bool true; killall Finder'
alias desktop-osx-off='defaults write com.apple.finder CreateDesktop -bool false; killall Finder'
alias desktop-off='gsettings set org.gnome.desktop.background show-desktop-icons false'
alias desktop-on='gsettings set org.gnome.desktop.background show-desktop-icons true'

alias desktop-osx-on='defaults write com.apple.finder CreateDesktop -bool true; killall Finder'
alias desktop-osx-off='defaults write com.apple.finder CreateDesktop -bool false; killall Finder'

alias yt='noglob youtube-dl -x --output "%(title)s.%(ext)s"'
alias kng='sudo killall aircrack-ng'


alias rake="noglob rake"
alias zeus="noglob zeus"

