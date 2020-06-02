# PACS


Dado que esta aplicación funciona con traefik como ingress y el mismo esta preparado para usar un certificado pasado por el usuario en formato PEM (entregado por let's encrypt). Se plantea el siguiente escenario para poder comunicar con keycloak sin inconvenientes de firma de certificado


- Crear un secret con los certificados utilizados por traefik (PEM -> CRT)
- Crear dos secret con los keystores para key y cacerts
- Montar los keystore en el contenedor