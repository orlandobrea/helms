FROM dcm4che/dcm4chee-arc-psql:5.22.4-secure

# Agrega el cert de keycloak al store de java
COPY load-hook.sh /load-hook.sh
COPY dcm4chee-arc.xml /docker-entrypoint.d/configuration/dcm4chee-arc.xml

ENTRYPOINT ["/load-hook.sh"]
CMD ["standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]