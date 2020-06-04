#!/bin/sh

docker build --no-cache  -t orlandobrea/init-pem-to-cert:1.0.0 .
docker push orlandobrea/init-pem-to-cert:1.0.0