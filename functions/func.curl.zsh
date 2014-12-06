function gocurl(){
  sh ~/.gocurl
}

function setcurl(){
  echo '#!/bin/bash' > ~/.gocurl
  echo $1 >> ~/.gocurl
}
