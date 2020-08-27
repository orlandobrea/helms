#!/bin/bash

# File to check if this script was already run
FILE=/opt/keycloak/standalone/configuration/CLIENTS_IMPORTED

if test -f "$FILE"; then
    exit 0;
fi

# Ping keycloak to check if it's up
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8880)

# Wait for keycloak to be up and running
while [ $STATUS -ne 200 ]
do
    sleep 5s
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8880)
done

# Login with keycloak client
/opt/keycloak/bin/kcadm.sh config credentials --server http://localhost:8880/auth --realm dcm4che --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD

# Prepare and import dcm4chee-arc-ui client
sed 's/{{DOMAIN}}/'$GLOBAL_DOMAIN'/g' /clients_conf/dcm4chee-arc-ui.json.tpl > /clients_conf/dcm4chee-arc-ui.json
/opt/keycloak/bin/kcadm.sh create clients -r dcm4che -f /clients_conf/dcm4chee-arc-ui.json

# Prepare and import ohif client
sed 's/{{DOMAIN}}/'$GLOBAL_DOMAIN'/g' /clients_conf/ohif.json.tpl > /clients_conf/ohif.json
/opt/keycloak/bin/kcadm.sh create clients -r dcm4che -f /clients_conf/ohif.json

# Prepare and import wildfly-console client
sed 's/{{DOMAIN}}/'$GLOBAL_DOMAIN'/g' /clients_conf/wildfly-console.json.tpl > /clients_conf/wildfly-console.json
/opt/keycloak/bin/kcadm.sh create clients -r dcm4che -f /clients_conf/wildfly-console.json

# Prepare and import kibana client (this one uses confidential login => it provides secret)
sed 's/{{DOMAIN}}/'$GLOBAL_DOMAIN'/g' /clients_conf/kibana.json.tpl > /clients_conf/kibana.tmp
sed 's/{{KIBANA_CLIENT_SECRET}}/'$KIBANA_CLIENT_SECRET'/g' /clients_conf/kibana.tmp > /clients_conf/kibana.json
/opt/keycloak/bin/kcadm.sh create clients -r dcm4che -f /clients_conf/kibana.json
rm /clients_conf/kibana.tmp

touch $FILE