# PACS


Dado que esta aplicación funciona con traefik como ingress y los certificados actualmente no son solicitados desde un cert-manager o traefik, se va a seguir el siguiente proceso:


- Solicitar al usuario los certificados (ca.crt y tls.crt)
- Montar los certificados en /opt/certs/keycloak
- Usar la imagen orlandobrea/dcm4chee-arc-psql:5.22.1-secure para agregar los certificados en el keystore

