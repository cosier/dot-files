function opos-to-mp3(){
  for f in *opus; do
    ffmpeg -i "$f" "$f.mp3"
  done
}
function mkv-to-mp4(){
  for f in *mkv; do
    ffmpeg -i "$f" "$f.mp4"
  done
}

function webm-to-mp4(){
  for f in *webm; do
    ffmpeg -i "$f" "$f.mp4"
  done
}

function flac-to-mp3(){
  for f in *flac; do
    ffmpeg -i "$f" "$f.mp3"
  done
}

function combine-mp3 () {
  if [ -z "$1" ]; then echo "provide an output filename"; return; fi
  find . -maxdepth 1 -iname '*.mp3' -print0 | sort -z | xargs -0 mp3wrap $1
}
