#!/bin/sh

# echo "--HOOK--"
# echo "--DEBUG--"
# echo $@
# echo "--DEBUG END--"



set -e

echo "Initializing keystore..."
FILE=/opt/certs/keycloak/ca.crt
if [ -f "$FILE" ]; then
    echo "Adding certificate to cacerts.jks"
    keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/ca.crt -keystore /docker-entrypoint.d/configuration/keystores/cacerts.jks -noprompt -storepass secret
    echo "Adding certificate to key.jks"
    keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/ca.crt -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret    
else
    echo "No certs found (/opt/certs/keycloak/ca.crt not found)"
fi

echo "Ready to start app..."



/docker-entrypoint.sh $@