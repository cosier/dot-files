function slack_cleanup(){
  echo "[slack] Engaging cleanup..."

  JOBS_STILL_RUNNING=$(jobs -l | awk '{ printf $3 " " }')

  if [[ $JOBS_STILL_RUNNING != "" ]]; then
    echo "[slack] Killing slack jobs: $JOBS_STILL_RUNNING"
    jobs -l | awk '{ print $3 }' | xargs kill > /dev/null 2>&1
  else
    echo "[slack] No Jobs still runnning, clean exit!"

  fi
  echo "[slack] all clean!"
}

function slack_stay(){
  trap slack_cleanup INT TERM

  echo "[slack] TenderFoot Stay"
  slack-keep-presence -t xoxp-2766191483-94383005472-102129985908-b76741d911b5bf15c321ab1019793a9b &

  echo "[slack] Crowdist Stay"
  slack-keep-presence -t xoxp-62927232720-62933735303-100024798962-a1416fdc7d933345104d052367102030 &

  wait $(jobs -l | awk '{ printf $3 " " }')
  echo "[slack] exit"
}

