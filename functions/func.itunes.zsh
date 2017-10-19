function iplay(){
  echo -n "Telling itunes to play: "
  osascript << EOF
    tell application "iTunes"
      play
      get name of current track
    end tell
EOF

}

function ipause() {
  echo -n "Telling itunes to pause: "
  osascript << EOF
    tell application "iTunes"
      pause
      get name of current track
    end tell
EOF
}

function ivol-up() {
  echo -n "Telling itunes to increase volume: "
  osascript << EOF
    tell application "iTunes"
      vol up
    end tell
EOF
}

function ivol-down() {
  echo -n "Telling itunes to increase volume: "
  osascript << EOF
    tell application "iTunes"
      vol down
    end tell
EOF
}
