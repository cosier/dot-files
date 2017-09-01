
function terminator_config_switch() {
  conf=$1

  if [ -f $conf ]; then
    ln -sf $conf ~/.config/terminator/config
  fi

}

function go-light() {
  echo "light" > ~/.colour-theme
  echo "set background=light" > ~/.colour-theme.vim
  term_config=~/.config/terminator/config.light
  terminator_config_switch $term_config
}

function go-dark() {
  echo "dark" > ~/.colour-theme
  echo "set background=dark" > ~/.colour-theme.vim

  term_config=~/.config/terminator/config.dark
  terminator_config_switch $term_config
}
