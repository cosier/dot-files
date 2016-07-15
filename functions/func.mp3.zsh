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
