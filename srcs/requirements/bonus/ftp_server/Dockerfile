FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get install -y vsftpd ssl-cert gettext-base

COPY conf/vsftpd.conf /etc/vsftpd.conf.template
COPY conf/start-vsftpd.sh /start-vsftpd.sh

RUN chmod +x /start-vsftpd.sh

ENV FILE_OPEN_MODE=0666
EXPOSE 20 21 21000-21010

ENTRYPOINT ["/start-vsftpd.sh"]