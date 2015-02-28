alias push='git remote | xargs -P10 -l git push --all'
alias gh='git diff HEAD'

alias git-reset-last-commit='GIT_COMMITTER_DATE="$DATE" git commit --amend --date "$DATE"'


function git-reset(){
  COMMIT=$(git log -n $1 --pretty=format:"%H" | tail -n1)
  TARGET_DATE=$2
  FILTER_COMMAND="if [ \$GIT_COMMIT = '$COMMIT' ]; then export GIT_AUTHOR_DATE='$TARGET_DATE'; export GIT_COMMITTER_DATE='$TARGET_DATE'; fi;"

  echo "GIT_COMMIT=$1"
  echo "TARGET_DATE=$TARGET_DATE"
  echo "FILTER_COMMAND=$FILTER_COMMAND"

  git filter-branch -f --env-filter "$FILTER_COMMAND"
}


