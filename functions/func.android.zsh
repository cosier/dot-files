android-emu() {
  $ANDROID_HOME/tools/emulator $@
}

android-emu-default() {
  android-emu -avd Nexus_5X_API_26_x86
}
