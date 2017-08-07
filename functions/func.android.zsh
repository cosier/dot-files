android-emulator() {
  $ANDROID_HOME/tools/emulator $@
}

android-emu() {
  android-emulator -avd nx6_api_25_x86_64
}

android-emu-x86-64() {
  android-emulator -avd nx6_api_25_x86_64
}

android-emu-armv7a() {
  android-emulator -avd nx6_api_25_armv7a
}

android-emu-arm() {
  android-emulator -avd nx6_api_25_armv7a
}
