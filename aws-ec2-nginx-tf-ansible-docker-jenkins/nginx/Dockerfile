FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs

COPY static-site/index* /etc/nginx/html/
COPY static-site/nginx.conf /etc/nginx/

RUN openssl req -x509 -nodes -days 365 -subj "/C=US/ST=FL/O=Parlor Design, LLC/CN=milisucevic.com" -newkey rsa:2048 -keyout /etc/nginx/private/nginx-selfsigned.key -out /etc/nginx/certs/nginx-selfsigned.crt;
