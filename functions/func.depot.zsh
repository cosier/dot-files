export DEPOT_TOOLS=~/.depot_tools
function depot_install(){
  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git $DEPOT_TOOLS
}

function depot_load(){
  export PATH=$PATH:~/.depot_tools
}

depot_load
