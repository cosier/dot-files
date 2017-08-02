function opus-to-mp3(){
  for f in *opus; do
    f=$(echo $f | sed 's/\.opus//')
    ffmpeg -i "$f.opus" "$f.mp3"
  done
}

function wav-to-mp3(){
  for f in *wav; do
    f=$(echo $f | sed 's/\.wav//')
    ffmpeg -i "$f.wav" "$f.mp3"
  done
}

function mkv-to-mp4(){
  for f in *mkv; do
    f=$(echo $f | sed 's/\.mk4//')
    ffmpeg -i "$f.mkv" "$f.mp4"
  done
}

function ogg-to-mp3(){
  for f in *ogg; do
    f=$(echo $f | sed 's/\.ogg//')
    ffmpeg -i "$f.ogg" "$f.mp3"
  done
}

function m4a-to-mp3(){
  for f in *m4a; do
    ffmpeg -i "$f.m4a" "$f.mp3"
  done
}

function webm-to-mp4(){
  for f in *webm; do
    f=$(echo $f | sed 's/\.webm//')
    ffmpeg -i "$f.webm" "$f.mp4"
  done
}

function flac-to-mp3(){
  for f in *flac; do
    f=$(echo $f | sed 's/\.flac//')
    ffmpeg -i "$f.flac" "$f.mp3"
  done
}

function aac-to-mp3(){
  for f in *aac; do
    ffmpeg -i "$f" -c:a libfdk_aac -q:a 330 "$f.mp3"
  done
}

function combine-mp3 () {
  if [ -z "$1" ]; then echo "provide an output filename"; return; fi
  find . -maxdepth 1 -iname '*.mp3' -print0 | sort -z | xargs -0 mp3wrap $1
}
