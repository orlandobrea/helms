FROM dcm4che/logstash-dcm4chee:7.6.0-10

COPY logstash.yml /etc/logstash.yml

COPY logstash-monitor.yml /usr/share/logstash/config/logstash.yml

ENV ELASTICSEARCH_HOST=elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    SYSLOG_HTTP_PORT=8080
