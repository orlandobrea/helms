#!/bin/sh

docker build -t orlandobrea/dcm4che-keycloak:10.0.1 .
docker push orlandobrea/dcm4che-keycloak:10.0.1