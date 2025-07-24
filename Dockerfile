FROM ubuntu:22.04

RUN apt-get update && apt-get install -y ffmpeg nginx

RUN rm -rf /var/www/html/*
RUN mkdir -p /var/www/html/hls

COPY start.sh /start.sh
COPY nginx.conf /etc/nginx/sites-enabled/default

RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
