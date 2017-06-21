function pbcopy_cross_platform() {
  if [[ "$(which xclip)" != "" ]]; then
    xclip -selection clipboad $@
  else
    pbcopy $@
  fi
}
