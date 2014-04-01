#!/bin/zsh

mkdir -p ~/.dot
cd ~/.dot

#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#echo "DIR: $DIR";


git update-index -q --refresh
CHANGED=$(git diff-index --name-only HEAD --)
GITROOT=~/.dot

if [ -n "$CHANGED" ]; then
  echo -e "Committing changes..."
  git add  --all .;
  git commit -m "Auto update...";
  git push origin master
else
  echo -e "Pulling Updates"
  git pull origin master
fi


