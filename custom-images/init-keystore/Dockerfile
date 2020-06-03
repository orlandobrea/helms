FROM alpine

RUN apk add --update openssl openjdk11-jre-headless && rm -rf /var/cache/apk/*

VOLUME ["/opt/input", "/opt/output"]

COPY keystores /opt/output/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]