#!/bin/sh

helm package dcm4che
helm repo index .
git add dcm4che-0.1.1.tgz 
git add index.yaml
git commit -m "Auto message"
git push origin