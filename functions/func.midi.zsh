alias midi-run='~/Developer/work/dimappio/bin/run'


function midi-session-one() {
  clear
  dimappio -x32:0 $@ -r \
    "G3: G2|F3 |A3|Bb3|D4" \
    "F3: F2|G#3|C4|D#4|G4" \
    "D4: A#2|G#3|D4" \
    "C3: D#2|F3|G3"
}

alias session-one='source ~/.dot/functions/func.midi.zsh; midi-session-one'

