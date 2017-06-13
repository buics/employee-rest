#!/bin/sh

if [ -z $CF_ORG ]; then
  CF_ORG="$BLUEMIX_ORG"
fi
if [ -z $CF_SPACE ]; then
  CF_SPACE="$BLUEMIX_SPACE"
fi


if [ -z "$BLUEMIX_USER" ] || [ -z "$BLUEMIX_PASSWORD" ] || [ -z "$BLUEMIX_ACCOUNT" ]; then
  echo "Define all required environment variables and rerun the stage."
  exit 1
fi
echo "Deploy pods"

echo "bx login -a $CF_TARGET_URL"
bx login -a "https://api.ng.bluemix.net" -u "ozlionel123@gmail.com" -p "OssiBuics123!" -c "a7495033fb50e495761cefe4462467e8" -o "ossi_org" -s "dev"
if [ $? -ne 0 ]; then
  echo "Failed to authenticate to Bluemix"
  exit 1
fi

echo "bx cr login"
bx cr login

# Init container clusters
echo "bx cs init"
bx cs init

if [ $? -ne 0 ]; then
  echo "Failed to initialize to Bluemix Container Service"
  exit 1
fi
