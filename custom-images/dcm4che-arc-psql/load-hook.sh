#!/bin/sh

# echo "--HOOK--"
# echo "--DEBUG--"
# echo $@
# echo "--DEBUG END--"


#set -e

echo "Initializing keystore..."
FILE=/opt/certs/keycloak/ca.crt

# Debug
# cat $FILE | base64

if [ -f "$FILE" ]; then
    echo "Adding certificate to cacerts.jks"
    keytool -import -trustcacerts -alias keycloak -file $FILE -keystore /docker-entrypoint.d/configuration/keystores/cacerts.jks -noprompt -storepass secret  
    keytool -import -trustcacerts -alias keycloak_new -file $FILE -keystore /opt/wildfly/standalone/configuration/keystores/cacerts.jks -noprompt -storepass secret
    RESULT=$?
    if [ $RESULT <> 0 ]; then
        echo "Replacing keycloak_new from cacerts.jks"
        keytool -delete -alias keycloak_new -keystore /opt/wildfly/standalone/configuration/keystores/cacerts.jks -noprompt -storepass secret  
        keytool -import -trustcacerts -alias keycloak_new -file $FILE -keystore /opt/wildfly/standalone/configuration/keystores/cacerts.jks -noprompt -storepass secret 
    fi       
    
    echo "Adding certificate to key.jks"


    keytool -import -trustcacerts -alias keycloak -file $FILE -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret    
    RESULT=$?
    if [ $RESULT <> 0 ]; then
        keytool -delete -alias keycloak -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret    
        keytool -import -trustcacerts -alias keycloak -file $FILE -keystore /docker-entrypoint.d/configuration/keystores/key.jks -noprompt -storepass secret    
    fi
    keytool -import -trustcacerts -alias keycloak_new -file $FILE -keystore /opt/wildfly/standalone/configuration/keystores/key.jks -noprompt -storepass secret   
    RESULT=$?
    if [ $RESULT <> 0 ]; then
        keytool -delete -alias keycloak_new -keystore /opt/wildfly/standalone/configuration/keystores/key.jks -noprompt -storepass secret    
        keytool -import -trustcacerts -alias keycloak_new -file $FILE -keystore /opt/wildfly/standalone/configuration/keystores/key.jks -noprompt -storepass secret 
    fi    

else
    echo "No certs found ($FILE not found)"
fi


#echo "Use the following line in a script to enable the jboss_cli without asking for cert approval"
#openssl s_client -connect $HOSTNAME:$MANAGEMENT_HTTPS_PORT 2>&1 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' |keytool -alias local -import -keystore ~/.jboss-cli.truststore -storepass cli_truststore -noprompt
# Reload
# cd /opt/wildfly/standalone/bin && ./jboss-cli.sh --connect command=:reload

echo "Ready to start app..."




/docker-entrypoint.sh $@