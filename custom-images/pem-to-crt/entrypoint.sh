#!/bin/sh

set -e

# INPUT /opt/input (privkey.pem / fullchain.pem)
# CRT/Keystore OUTPUT /opt/output
echo "init-container: to import PEMs into Keystores"

echo "Converting fullchain.pem to ca.crt"
openssl x509 -outform der -in /opt/input/fullchain.pem -out /opt/output/ca.crt
echo "Generating server.pem"
( openssl x509 -in /opt/input/fullchain.pem; cat /opt/input/privkey.pem ) > /opt/output/server.pem
echo "Converting server.pem to tls.crt"
openssl x509 -outform der -in /opt/output/server.pem -out /opt/output/tls.crt
# echo "Importing ca.crt into cacarts.jks"
# keytool -import -trustcacerts -alias keycloak -file /opt/output/ca.crt -keystore /opt/output/cacerts.jks -noprompt -storepass secret
# echo "Importing tls.crt into key.jks"
# keytool -import -trustcacerts -alias keycloak -file /opt/output/tls.crt -keystore /opt/output/key.jks -noprompt -storepass secret
# echo "Finished ok"