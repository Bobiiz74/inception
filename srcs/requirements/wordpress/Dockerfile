FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget

RUN apt-get install -y php7.4\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.5-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.5-fr_FR.tar.gz && rm wordpress-6.5-fr_FR.tar.gz
RUN	chmod -R 755 /var/www/wordpress

COPY ./conf/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /run/php
RUN chmod 755 /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/auto_config.sh /etc/auto_config.sh
COPY ./tools/inception.txt /tmp/inception.txt

RUN chmod +x /etc/auto_config.sh

EXPOSE 9000

WORKDIR /var/www/wordpress

CMD ["sh", "/etc/auto_config.sh"]
