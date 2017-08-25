#!/bin/zsh

mkdir -p ~/.dot
cd ~/.dot

#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo "DIR: $DIR";


git update-index -q --refresh
CHANGED=$(git diff-index --name-only HEAD --)
GITROOT=~/.dot

if [[ $1 != "" ]]; then
  msg=$1
else
  msg="[up] auto update"
fi

if [ -n "$CHANGED" ]; then
  echo -e "Committing changes..."
  git add  --all .;
  git commit -m $msg;
  git pull origin master
  git push origin master
else
  echo -e "Pulling Updates"
  git pull origin master
fi


