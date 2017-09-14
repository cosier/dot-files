
function install-zsh-themes {
  ln -sf ~/.dot/baileys-magic.zsh-theme ~/.oh-my-zsh/themes/baileys-magic.zsh-theme
}

function edit-zsh-theme() {
  THEME=~/.oh-my-zsh/themes/$ZSH_THEME.zsh-theme
  if [ -f $THEME ]; then
    vim $THEME
  else
    echo "$ZSH_THEME not found at: $THEME"
    return 1
  fi
}

function reload-zsh-theme() {
  source ~/.zshrc
}

function terminator_config_switch() {
  conf=$1
  if [ -f $conf ]; then
    ln -sf $conf ~/.config/terminator/config
  fi
}

function guake_config_switch() {
  conf=$1
  if [ -f $conf ]; then
    ln -sf $conf ~/.gconf/apps/guake/style/font/%gconf.xml
  fi
}

function go-light() {
  echo "light" > ~/.colour-theme
  echo "set background=light" > ~/.colour-theme.vim

  term_config=~/.config/terminator/config.light
  terminator_config_switch $term_config

  guake_config=~/.dot/guake/gconf.xml.light
  guake_config_switch $guake_config
}

function go-dark() {
  echo "dark" > ~/.colour-theme
  echo "set background=dark" > ~/.colour-theme.vim

  term_config=~/.config/terminator/config.dark
  terminator_config_switch $term_config

  if [[ $(uname) == "Linux" ]]; then
    guake_config=~/.dot/guake/gconf.xml.dark
    guake_config_switch $guake_config
  fi
}
