#!/bin/sh

docker build --no-cache  -t orlandobrea/dcm4chee-arc-psql:5.22.2-secure .
docker push orlandobrea/dcm4chee-arc-psql:5.22.2-secure