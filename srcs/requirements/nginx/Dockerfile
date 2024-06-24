FROM debian:bullseye

RUN apt update -y
RUN apt install nginx -y
RUN apt install vim -y    
RUN apt install curl -y 
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt -subj "/C=CH/ST=Lausanne/L=Lausanne/O=42/OU=42/CN=rgodtsch"

RUN chmod 755 /var/www/html 
RUN mkdir -p /var/www/html && chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]