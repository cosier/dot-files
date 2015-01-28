echoRun() {
  START=$(date +%s)
  echo "> $1"
  eval time $1
  END=$(date +%s)
  DIFF=$(( $END - $START ))
  echo "It took $DIFF seconds"
}

alias zr='zeus rake'

alias parallel_prepare='rake parallel:prepare ; "rake parallel:rake\[db:globals\]" '

zps() {
  # Run parallel_rspec, using zeus, passing in number of threads, default is 6

  p=${1:-6}
  # Skipping zeus b/c env vars don't work with zeus

  # start zeus log level fata
  # echoRun "SKIP_RSPEC_FOCUS=YES RSPEC_RETRY_COUNT=7 RAILS_LOGGER_LEVEL=4 zeus parallel_rspec -n $p spec"
  echoRun "zeus parallel_rspec -n $p spec"
}

# List processes related to rails
pgr() {
  for x in spring rails phantomjs zeus; do
    pgrep -fl $x;
  done
}

# Kill processes related to rails
pgk() {
  for x in spring rails phantomjs zeus; do
    pkill -fl $x;
  done
}
