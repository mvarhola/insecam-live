#!/bin/bash


 while :;
   do ffmpeg -re -i ~/ARP/output -vf scale=640:360 \
          -c:v h264 -c:a copy \
          -async 1 -maxrate 600k -f flv rtmp://localhost/rtmp/live;
 done
