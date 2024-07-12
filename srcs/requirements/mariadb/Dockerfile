FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/my.cnf /etc/mysql/my.cnf

COPY conf/config.sh /etc/mysql/mariadb.conf.d/config.sh

RUN bash /etc/mysql/mariadb.conf.d/config.sh


