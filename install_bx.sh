#!/bin/bash

echo "Download Bluemix CLI"
wget --quiet --output-document=${EXT_DIR}/Bluemix_CLI_amd64.tar.gz  http://public.dhe.ibm.com/cloud/bluemix/cli/bluemix-cli/latest/Bluemix_CLI_amd64.tar.gz
tar -xf ${EXT_DIR}/Bluemix_CLI_amd64.tar.gz --directory=${EXT_DIR}

# Create bx alias
echo "#!/bin/sh" >${EXT_DIR}/Bluemix_CLI/bin/bx
echo "${EXT_DIR}/Bluemix_CLI/bin/bluemix \"\$@\" " >>${EXT_DIR}/Bluemix_CLI/bin/bx
chmod +x ${EXT_DIR}/Bluemix_CLI/bin/*

export PATH="${EXT_DIR}/Bluemix_CLI/bin:$PATH"

# Install Armada CS plugin
echo "Install the Bluemix container-service plugin"
bx plugin install container-service -r Bluemix
chmod +x ${EXT_DIR}/Bluemix_CLI/bin/*

echo "Install kubectl"
wget --quiet --output-document=${EXT_DIR}/Bluemix_CLI/bin/kubectl  https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ${EXT_DIR}/Bluemix_CLI/bin/kubectl

if [ -n "$DEBUG" ]; then
  bx --version
  bx plugin list
fi
