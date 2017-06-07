#!/bin/bash
#Download video from a random webcam

fps=24
seconds_to_dl=20
url=$(./insecure-random.rb)
filename="$(date +%Y%m%d_%H%M%S).flv"

echo $url
ffmpeg -hide_banner -loglevel panic -i $url -s 640x480 -vcodec flv -r $fps -frames:v $(( $fps*$seconds_to_dl )) -q:v 10 -an ~/ARP/videos/$filename

