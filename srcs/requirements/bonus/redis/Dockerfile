FROM debian:bookworm

RUN apt update -y && apt upgrade -y
RUN apt-get install redis-server -y
COPY conf/redis.conf /etc/redis/redis.conf
EXPOSE 6379
ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]