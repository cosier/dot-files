function flux() {
  temp=$1
  echo "Setting temp: $temp"

  defaults write org.herf.Flux customNightColorTemp -int $temp && \
  defaults write org.herf.Flux NightColorTemp -int $temp
}
