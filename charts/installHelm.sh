#!/bin/sh

helm install test-elastic ./dcm4che-elastic
helm install test-kibana ./dcm4che-kibana
helm install test-logstash ./dcm4che-logstash
helm install test-slapd ./dcm4che-slapd
helm install test-keycloak ./dcm4che-keycloak
helm install test-postgres ./dcm4che-postgres
helm install test-pacs ./dcm4che-pacs
helm install test-gatekeeper ./dcm4che-gatekeeper
