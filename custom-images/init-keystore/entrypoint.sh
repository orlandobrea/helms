#!/bin/sh

set -e

# INPUT /opt/input (privkey.pem / fullchain.pem)
# CRT/Keystore OUTPUT /opt/output

openssl x509 -outform der -in /opt/input/fullchain.pem -out /opt/output/ca.crt
openssl x509 -outform der -in /opt/input/privkey.pem -out /opt/output/tls.crt

keytool -import -trustcacerts -alias keycloak -file /opt/output/ca.crt -keystore /opt/output/cacerts.jks -noprompt -storepass secret
keytool -import -trustcacerts -alias keycloak -file /opt/output/tls.crt -keystore /opt/output/key.jks -noprompt -storepass secret
