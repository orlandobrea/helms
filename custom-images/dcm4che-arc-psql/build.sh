#!/bin/sh

docker build --no-cache  -t orlandobrea/dcm4chee-arc-psql:5.22.1-secure .
docker push orlandobrea/dcm4chee-arc-psql:5.22.1-secure