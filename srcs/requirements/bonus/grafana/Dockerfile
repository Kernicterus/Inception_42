FROM debian:bullseye

RUN apt update -y && apt upgrade -y && mkdir -p /etc/apt/keyrings/
RUN apt-get -y install wget gnupg lsb-release 
RUN wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | tee /etc/apt/keyrings/grafana.gpg > /dev/null
RUN echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" |  tee -a /etc/apt/sources.list.d/grafana.list
RUN apt-get update && apt-get install -y grafana
RUN apt-get clean
COPY conf/grafana.ini.template /etc/grafana/grafana.ini.template
COPY conf/mariadb.yml.template  /etc/grafana/provisioning/datasources/mariadb.yml.template
COPY conf/config.sh /config.sh
EXPOSE 8878

ENTRYPOINT ["bash", "/config.sh"]