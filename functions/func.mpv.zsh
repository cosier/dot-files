function mpv_loop() {
  start_min=$(($1 * 60))

  if [ -n "$3" ]; then
    MPV_FILE=$3
    end_min=$(($2 * 60))
  else
    MPV_FILE=$2
    end_min=$((($1 + 1) * 60))
  fi

  MPV_START=$(date --utc --date "1970-01-01 ${start_min} min" "+%T")
  MPV_END=$(date --utc --date "1970-01-01 ${end_min} min" "+%T")

  # echo
  # echo "BEGIN: $start_min $MPV_START"
  # echo "FINIT: $end_min $MPV_END  "
  # echo -e "\n$MPV_FILE"

  CMD="/usr/bin/mpv --start=$MPV_START --ab-loop-a=$MPV_START --ab-loop-b=$MPV_END $MPV_FILE"
  echo $CMD
}
