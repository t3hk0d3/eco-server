#!/bin/bash

ECO_INSTALL_DIR="/srv/eco-server"

ECO_FILENAME="EcoServer_v${ECO_VERSION}.zip"

ECO_SERVER_URL="https://s3-us-west-2.amazonaws.com/eco-releases/$ECO_FILENAME"
ECO_LOCAL_FILE="$ECO_INSTALL_DIR/$ECO_FILENAME"


wget --progress=bar:force:noscroll $ECO_SERVER_URL -O $ECO_LOCAL_FILE || exit 1

# Check file for only specific version
grep "$ECO_FILENAME" SHA256SUMS | sha256sum -c - || exit 1

unzip -q $ECO_LOCAL_FILE -d $ECO_INSTALL_DIR

# Move defaults so they could be copied on start, not overwritten by mounted volumes
mv Configs DefaultConfigs
mv Storage DefaultStorage

exit 0
