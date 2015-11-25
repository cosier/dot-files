function static-server(){
  ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 8000, :DocumentRoot => Dir.pwd).start'
}

function static-server-80(){
  sudo ruby -rwebrick -e'WEBrick::HTTPServer.new(:Port => 80, :DocumentRoot => Dir.pwd).start'
}
