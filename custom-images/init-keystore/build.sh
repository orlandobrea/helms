#!/bin/sh

docker build --no-cache  -t orlandobrea/init-keystore:1.0.0 .
docker push orlandobrea/init-keystore:1.0.0