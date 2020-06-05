#!/bin/sh

# echo "--HOOK--"
# echo "--DEBUG--"
# echo $@
# echo "--DEBUG END--"



set -e

echo "Adding certificate to cacerts.jks"
keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/ca.crt -keystore /docker-entrypoint.d/configuration/keystores/cacerts.jks -noprompt -storepass secret
echo "Adding certificate to key.jks"
keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/ca.crt -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret

echo "Ready to start app..."



/docker-entrypoint.sh $@