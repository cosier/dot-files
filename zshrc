# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
function virtualenv_prompt_info(){}
skip_global_compinit=1
export LANG=en_US.UTF-8
export GIT_EDITOR=vim
export PGDATA="/usr/local/var/postgres"

export HOMEBREW_GITHUB_API_TOKEN=15aaa9625f002474d5fbfe9bcaa9f83fe09ee3b7

TERM=screen-256color

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line

hostname=$(hostname)

# Logic for selective themes
# across various different devices
case "$hostname" in
    *vagrant*)
        echo -e "Vagrant Box Detected: $hostname"
        ZSH_THEME="blinks"
        ;;

    *virtual*)
        echo -e "Virtual Machine Detected: $hostname"
        ZSH_THEME="blinks"
        ;;

    *)
      #echo -e "Vanilla Box Detected: $hostname"
      ZSH_THEME="bira"
      ;;
esac


ZSH_THEME="bira"
HISTSIZE=5000 # session history size
SAVEHIST=1000 # saved history

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

# COMPLETION_WAITING_DOTS="true"

plugins=(git ruby)

source $ZSH/oh-my-zsh.sh
source ~/.dot/envs.zsh
source ~/.dot/commands.zsh
source ~/.dot/funcs.zsh
source ~/.dot/scripts.zsh
source ~/.dot/places.zsh
source ~/.dot/paths.zsh
source ~/.dot/tunnels.zsh
source ~/.dot/services.zsh
source ~/.dot/projects.zsh
source ~/.dot/colors

if [[ -a /usr/local/rvm/scripts/rvm ]]; then
    source /usr/local/rvm/scripts/rvm
fi

if [[ -a ~/.rvm/scripts/rvm ]]; then
    source ~/.rvm/scripts/rvm
fi

if [[ -a ~/.Xmodmap ]]; then
    xmodmap ~/.Xmodmap
fi


PATH=/opt/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if [[ -a ~/.dot_hook ]]; then
  clr_escape "Platform Hook Detected" $CLR_GREEN
   source ~/.dot_hook
fi



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

docker-env fusion silent
