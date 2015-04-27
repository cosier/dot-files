function gittempt(){
  git filter-branch --force --index-filter \
    'git rm --cached -r --ignore-unmatch node_modules' \
    --prune-empty --tag-name-filter cat -- --all
}
