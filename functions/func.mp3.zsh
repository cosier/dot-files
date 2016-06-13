function opos-to-mp3(){
  for f in *opus; do
    ffmpeg -i "$f" "$f.mp3"
  done
}
