#!/bin/bash
cat </etc/grafana/grafana.ini.template >/etc/grafana/grafana.ini
cat </etc/grafana/provisioning/datasources/mariadb.yml.template >/etc/grafana/provisioning/datasources/mariadb.yml
grafana-server --homepath=/usr/share/grafana --config=/etc/grafana/grafana.ini