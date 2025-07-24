#!/bin/bash

service nginx start

ffmpeg -i "rtsp://veritron:Intelbras1@veritron.ddns-intelbras.com.br:554/cam/realmonitor?channel=1&subtype=1" \
-c:v copy -c:a copy -f hls -hls_time 2 -hls_list_size 5 -hls_flags delete_segments /var/www/html/hls/stream.m3u8 &

nginx -g "daemon off;"
