function convert_mb_to_bytes() {
  MB=$
  sectors=$((${MB}*1024*1024/512))
  echo "$sectors"
}
