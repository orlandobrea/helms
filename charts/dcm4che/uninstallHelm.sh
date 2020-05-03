#!/bin/sh

helm uninstall test-elastic
helm uninstall test-kibana
helm uninstall test-logstash
helm uninstall test-slapd
helm uninstall test-keycloak
helm uninstall test-postgres
helm uninstall test-pacs
#helm uninstall test-gatekeeper
