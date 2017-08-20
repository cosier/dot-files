# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
function virtualenv_prompt_info(){}

skip_global_compinit=1
export LANG=en_US.UTF-8
export GIT_EDITOR=vim
export PGDATA="/usr/local/var/postgres"

export TEST_API=true

export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME}\007';$PROMPT_COMMAND"

export HOMEBREW_NO_AUTO_UPDATE=1

ZSH_THEME="bira"

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE

# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"

DISABLE_AUTO_TITLE="true"

# COMPLETION_WAITING_DOTS="true"

plugins=(git git-flow-completion )

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

# if [[ -a /usr/local/rvm/scripts/rvm ]]; then
    # source /usr/local/rvm/scripts/rvm
# fi

# if [[ -a ~/.rvm/scripts/rvm ]]; then
    # source ~/.rvm/scripts/rvm
# fi

# if [[ -a ~/.Xmodmap ]]; then
    # xmodmap ~/.Xmodmap
# fi


PATH=/opt/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/.rvm/bin:$PATH # Add RVM to PATH for scripting

if [[ -a ~/.env.sh ]]; then
  # clr_escape "Platform Hook Detected" $CLR_GREEN
   source ~/.env.sh
fi

if [[ -a ~/.env ]]; then
  # clr_escape "Platform Hook Detected" $CLR_GREEN
   source ~/.env
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

## Command history configuration
if [ -z "$HISTFILE" ]; then
  HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# Allow nested tmux
export TMUX=~/.tmux.sock
export TERM=screen-256color

eval "$(rbenv init -)"
export RUST_BACKTRACE=1
export RUST_LOG="beetflo=debug"

export GOOGLE_APPLICATION_CREDENTIALS=~/.google_app_creds
# source <(kubectl completion zsh)

export ANDROID_NDK=~/Android/android-ndk-r15b
export ANDROID_SDK_HOME=~/Android/Sdk
export ANDROID_SDK=~/Android/Sdk
export ANDROID_HOME=~/Android/Sdk

export ANDROID_NDK_HOME=~/Android/android-ndk-r15b
export NDK_HOME=~/Android/android-ndk-r15b
export NDK_STANDALONE=~/Android/standalone-x86


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/home/bailey/.sdkman"
# [[ -s "/home/bailey/.sdkman/bin/sdkman-init.sh" ]] && source "/home/bailey/.sdkman/bin/sdkman-init.sh"
