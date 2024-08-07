FROM debian:bullseye

RUN apt update -y && apt upgrade -y && mkdir -p /etc/apt/keyrings/
RUN apt-get -y install wget gnupg lsb-release 
RUN wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null
RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" |  tee -a /etc/apt/sources.list.d/grafana.list
RUN apt-get update && apt-get install -y grafana
RUN apt-get clean
COPY conf/grafana.ini /etc/grafana/grafana.ini
COPY conf/mariadb.yml  /etc/grafana/provisioning/datasources/.
EXPOSE 8878

ENTRYPOINT ["grafana-server", "--homepath=/usr/share/grafana", "--config=/etc/grafana/grafana.ini"]