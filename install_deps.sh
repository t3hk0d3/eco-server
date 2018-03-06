#!/bin/bash

apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb http://download.mono-project.com/repo/debian beta-stretch main" > /etc/apt/sources.list.d/mono-official-beta.list

apt-get update -qq -y || exit 1
apt-get -y --allow-unauthenticated install unzip mono-complete wget || exit 1

rm -rf /var/lib/apt/lists/* /tmp/*

exit 0
