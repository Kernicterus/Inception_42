FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y \
&& mkdir -p /etc/nginx/ssl \
&& apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/certif.crt -keyout /etc/nginx/ssl/certif.key \
    -subj "/C=FR/ST=IDF/L=Angouleme/O=42/OU=42/CN=$DOMAIN_NAME/UID=$GLOBAL_USER"
RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/wordpress && chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]
