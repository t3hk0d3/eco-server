#!/bin/bash

ECO_FILENAME=$1

unzip /tmp/${ECO_FILENAME} -d /srv/eco-server/ || exit 1

rm -rf /tmp/*

exit 0
