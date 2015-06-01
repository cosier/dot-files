function sp-msg(){
  # BLOCKED NUMBER
  #FROM="7378742833"

  # VALID NUMBER
  FROM="19164096786"

  echo -en "\e[32mProcessing SMS..."

  curl -s "http://skejio.cosier.ca/twilio/sms?ToCountry=US&ToState=TX&SmsMessageSid=SM3573b47acf00ea53d9b66e2d3a51ee32&NumMedia=0&ToCity=&FromZip=10601&SmsSid=SM3573b47acf00ea53d9b66e2d3a51ee32&FromState=NY&SmsStatus=received&FromCity=WHITE+PLAINS&Body=$1&FromCountry=US&To=%2B12018855156&ToZip=&MessageSid=SM3573b47acf00ea53d9b66e2d3a51ee32&AccountSid=ACbb4322aeefca921cab474b3920916e45&From=%2B$FROM&ApiVersion=2010-04-01" > ~/.tmp_sp_msg

  echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  sed -e 's/<[^>]*>//g' ~/.tmp_sp_msg
  echo -n '\n'
}

function sp-call(){
  # BLOCKED NUMBER
  #FROM="7378742833"

  # VALID NUMBER
  FROM="19164096786"

  echo -en "\e[32mProcessing SMS..."
  curl -s "http://localhost:3000/twilio/voice?ToCountry=US&ToState=TX&SmsMessageSid=SM3573b47acf00ea53d9b66e2d3a51ee32&NumMedia=0&ToCity=&FromZip=10601&SmsSid=SM3573b47acf00ea53d9b66e2d3a51ee32&FromState=NY&SmsStatus=received&FromCity=WHITE+PLAINS&Digits=$1&FromCountry=US&To=%2B19402224539&ToZip=&MessageSid=SM3573b47acf00ea53d9b66e2d3a51ee32&AccountSid=ACbb4322aeefca921cab474b3920916e45&From=%2B$FROM&ApiVersion=2010-04-01" > ~/.tmp_sp_msg

  echo -en "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"
  sed -e 's/<[^>]*>//g' ~/.tmp_sp_msg
  echo -n '\n'
}

function sp-clear(){
  echo 'Clearing All Sessions, Logs and Customer Data.'
  echo '...'
  curl -s "http://localhost:3000/dev/clear"
  echo '\n'
}

function msg(){
  echo -en "\n"
  sp-msg $1
}

function call(){
  echo -en "\n"
  sp-call $1
}

function test-qe(){
  zeus rspec spec/features/query_engines_spec.rb
}

alias m='msg'
alias m1='m 1'
alias m2='m 2'
alias m3='m 3'
alias m4='m 4'
alias m5='m 5'
alias m6='m 6'



