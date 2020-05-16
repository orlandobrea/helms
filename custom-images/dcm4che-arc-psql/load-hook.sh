#!/bin/sh

echo "--HOOK--"
echo "--DEBUG--"
echo $@
echo "--DEBUG END--"

set -e

keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/ca.crt -keystore /docker-entrypoint.d/configuration/keystores/cacerts.jks -noprompt -storepass secret
keytool -import -trustcacerts -alias keycloak -file /opt/certs/keycloak/tls.crt -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret

echo "--HOOK END--"



/docker-entrypoint.sh $@