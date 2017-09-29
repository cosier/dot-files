function mpv_loop() {
  MPV_FILE=$3

  start_min=$(echo "($(echo "scale=0; $1 * 60" | bc) + 0.5)/1" | bc)
  end_min=$(echo "($(echo "scale=0; $2 * 60" | bc)+ 0.5)/1" | bc )

  # echo "start_min: $start_min"
  # echo "end_min: $end_min"

  MPV_START=$(date --utc --date "1970-01-01 ${start_min} min" "+%T")
  MPV_END=$(date --utc --date "1970-01-01 ${end_min} min" "+%T")

  # echo
  # echo -e "BEGIN: $start_min $MPV_START"
  # echo -e "FINIT: $end_min $MPV_END  "
  # echo -e "\n$MPV_FILE"

  CMD="mpv --start=$MPV_START --ab-loop-a=$MPV_START --ab-loop-b=$MPV_END $MPV_FILE"
  echo $CMD
  # mpv $CMD
}

function mpv_looper() {
  $(mpv_loop $1 $2 $3)
}

alias mpv_loop_fresh='source ~/.dot/functions/func.mpv.zsh; mpv_loop'
