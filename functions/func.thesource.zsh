function source-rails() {
  b2b
  rails s -p 7171
}

alias rails-source='source-rails'
alias rails-html='source-html; rails s -p 7172'

function source-html() {
  cd ~/Developer/work/dwe/html;
}
