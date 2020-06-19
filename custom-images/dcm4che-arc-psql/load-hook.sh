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

    echo "Adding $AUTH_SERVER TLS Cert to JBOSS keystore"
    openssl s_client -connect $AUTH_SERVER:$AUTH_SERVER_PORT 2>&1 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |keytool -import -trustcacerts -alias keycloak -keystore /docker-entrypoint.d/configuration/keystores/cacerts.jks -storepass secret -noprompt    

    echo "Adding $AUTH_SERVER TLS cacerts.jks"    
    openssl s_client -connect $AUTH_SERVER:$AUTH_SERVER_PORT 2>&1 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |keytool -import -trustcacerts -alias keycloak -keystore /docker-entrypoint.d/configuration/keystores/key.jks -storepass secret -noprompt      
fi


echo "Ready to start app..."




/docker-entrypoint.sh $@