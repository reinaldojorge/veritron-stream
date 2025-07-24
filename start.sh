#!/bin/bash

service nginx start

ffmpeg -analyzeduration 10000000 -probesize 10000000 \
-i "rtsp://veritron:Intelbras1@veritron.ddns-intelbras.com.br:554/cam/realmonitor?channel=1&subtype=1" \
-c:v copy -c:a aac -f hls -hls_time 2 -hls_list_size 5 -hls_flags delete_segments \
/var/www/html/hls/stream.m3u8
