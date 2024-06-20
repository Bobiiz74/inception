FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install vim -y    
RUN apt-get install mariadb-server -y


RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:root /var/run/mysqld

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/script.sh /etc/script.sh

RUN chmod +x /etc/script.sh 

EXPOSE 3306

ENTRYPOINT ["sh", "/etc/script.sh"]