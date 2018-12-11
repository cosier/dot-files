function terminal_set_title() {
  printf '\e]2;%s\a' "$*";
}
