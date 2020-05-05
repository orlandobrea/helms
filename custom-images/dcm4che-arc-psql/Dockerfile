FROM dcm4che/dcm4chee-arc-psql:5.22.1-secure

# Agrega el cert de keycloak al store de java
COPY load-hook.sh /load-hook.sh

ENTRYPOINT ["/load-hook.sh"]
CMD ["standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]