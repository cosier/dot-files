function gst-sink(){
  gst-launch souphttpsrc location=http://192.168.???.??:8080/strm ! jpegdec ! ffmpegcolorspace ! v4l2loopback device=/dev/video0
}
