FROM debian:buster-slim

RUN apt update -y && apt upgrade -y
RUN apt-get install -y curl gnupg \
&& curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
&& apt-get install -y nodejs

RUN npm install -g http-server
RUN mkdir -p /var/www/html
COPY files/home.html /var/www/html/.
COPY conf/config.sh /.
RUN chmod -x /config.sh
EXPOSE 9254
ENTRYPOINT ["bash", "/config.sh"]