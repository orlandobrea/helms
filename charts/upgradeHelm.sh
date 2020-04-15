#!/bin/sh

helm upgrade test-elastic ./dcm4che-elastic
helm upgrade test-kibana ./dcm4che-kibana
helm upgrade test-logstash ./dcm4che-logstash
