#!/bin/bash

ECO_INSTALL_DIR="/srv/eco-server"

ECO_FILENAME="EcoServer_v${ECO_VERSION}.zip"

ECO_SERVER_URL="https://s3-us-west-2.amazonaws.com/eco-releases/$ECO_FILENAME"
ECO_LOCAL_FILE="$ECO_INSTALL_DIR/$ECO_FILENAME"

# Checksum for server zip archive
SHA256SUM=$(grep "$ECO_FILENAME" SHA256SUMS)

# Download file
wget --progress=bar:force:noscroll $ECO_SERVER_URL -O $ECO_LOCAL_FILE || exit 1

# Check if checksum exists for this version
if [[ -z "${SHA256SUM}" ]]; then
  echo "SHA256 checksum is not found for $ECO_FILENAME"
  echo "Checksum for downloaded file is:"
  sha256sum $ECO_FILENAME
  exit 1
fi

# verify checksum
echo $SHA256SUM | sha256sum -c - || exit 1

# Extract server achive
unzip -q $ECO_LOCAL_FILE -d $ECO_INSTALL_DIR

# Move defaults so they could be copied on start, not overwritten by mounted volumes
mv Configs DefaultConfigs
mv Storage DefaultStorage

exit 0
