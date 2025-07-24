#!/bin/bash

# Cria a pasta para HLS se não existir
mkdir -p /var/www/html/hls

# Inicia o ffmpeg para converter o stream RTSP em HLS
ffmpeg -rtsp_transport tcp \
-i "rtsp://veritron:Intelbras1@veritron.ddns-intelbras.com.br:554/cam/realmonitor?channel=1&subtype=1" \
-c:v copy -c:a aac -f hls -hls_time 2 -hls_list_size 5 -hls_flags delete_segments \
/var/www/html/hls/stream.m3u8
