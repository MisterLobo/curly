#!/bin/bash

pwd

ARGS=$@

echo $ARGS

apt-get update
apt-get install -y curl tar

CWD=$(pwd)

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz

ls
tar -xf "$CWD/google-cloud-cli-linux-x86_64.tar.gz"

"$CWD/google-cloud-sdk/bin/gcloud" $@

#run deploy $_SERVICE_NAME --image '$_AR_HOSTNAME/$PROJECT_ID/$_AR_REPO/$_SERVICE_NAME:$COMMIT_SHA' --region $_DEPLOY_REGION --platform $_PLATFORM