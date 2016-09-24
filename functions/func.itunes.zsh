function iplay(){
  echo -n "Telling itunes to play: "
  osascript << EOF
    tell application "iTunes"
      play
      get name of current track
    end tell
EOF

}
