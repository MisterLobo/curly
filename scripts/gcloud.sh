#!/bin/bash

pwd

# Check env
echo $SERVICE_NAME
echo $AR_HOSTNAME
echo $PROJECT_ID
echo $AR_REPO
echo $SERVICE_NAME
echo $COMMIT_SHA
echo $DEPLOY_REGION
echo $PLATFORM

apt-get update
apt-get install -y curl tar

CWD=$(pwd)

curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz

ls
tar -xf "$CWD/google-cloud-cli-linux-x86_64.tar.gz"

"$CWD/google-cloud-sdk/bin/gcloud" --version
"$CWD/google-cloud-sdk/bin/gcloud" run deploy $SERVICE_NAME \
  --image "$AR_HOSTNAME/$PROJECT_ID/$AR_REPO/$SERVICE_NAME:$COMMIT_SHA" \
  --region $DEPLOY_REGION \
  --platform $PLATFORM

#run deploy $_SERVICE_NAME --image '$_AR_HOSTNAME/$PROJECT_ID/$_AR_REPO/$_SERVICE_NAME:$COMMIT_SHA' --region $_DEPLOY_REGION --platform $_PLATFORM