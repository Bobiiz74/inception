FROM debian:bullseye

RUN apt update
RUN apt install nginx -y
RUN apt install vim -y    
RUN apt install curl -y 
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42/OU=42/CN=rgodtsch"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html 

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]