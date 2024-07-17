FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt install curl php php-mysqli php-pdo php-pdo-mysql -y
ENV ADMINER_VERSION=4.8.0
RUN mkdir /adminer \
    && curl -L https://www.adminer.org/static/download/${ADMINER_VERSION}/adminer-${ADMINER_VERSION}.php -o /adminer/index.php
EXPOSE 8080
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/adminer"]