alias push='git remote | xargs -P10 -l git push --all'
alias gh='git diff HEAD'

alias git-reset-last-commit='GIT_COMMITTER_DATE="$DATE" git commit --amend --date "$DATE"'

alias gitp='git push --set-upstream origin master'
alias gp='git push'

alias gc='git commit -m'
alias gca='git commit -am'

function git-reset-to(){
  DATE=$1

  echo "Target Date: $DATE"
  git-reset-last-commit
}

function git-reset-by(){
  DELTA=$1
  if [[ "$(uname)" == "Darwin" ]]; then
    echo "Using BSD Date"
    DATE=$(date -v-$DELTA "+%m/%d/%Y %H:%M:%S")
  else
    echo "Using Gnu Date"
    DATE=$(date -ud"-$DELTA" "+%m/%d/%Y %H:%M:%S")
  fi

  echo "Target Date: $DATE"
  git-reset-last-commit
}

function git-reset(){
  COMMIT=$(git log -n $1 --pretty=format:"%H" | tail -n1)
  TARGET_DATE=$2
  FILTER_COMMAND="if [ \$GIT_COMMIT = '$COMMIT' ]; then export GIT_AUTHOR_DATE='$TARGET_DATE'; export GIT_COMMITTER_DATE='$TARGET_DATE'; fi;"

  echo "GIT_COMMIT=$1"
  echo "TARGET_DATE=$TARGET_DATE"
  echo "FILTER_COMMAND=$FILTER_COMMAND"

  git filter-branch -f --env-filter "$FILTER_COMMAND"
}


alias rebase='git rebase -i'
alias reb='rebase HEAD~2'
alias rebb='rebase HEAD~2'
alias rebbb='rebase HEAD~3'
alias rebbbb='rebase HEAD~4'
alias rebbbbb='rebase HEAD~5'
alias rebbbbbb='rebase HEAD~6'
alias rebbbbbbb='rebase HEAD~7'
alias rebbbbbbbb='rebase HEAD~8'
alias rebbbbbbbbb='rebase HEAD~9'
alias rebbbbbbbbbb='rebase HEAD~10'
