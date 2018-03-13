#!/bin/bash


if [ ! -f Configs/WorldGenerator.eco ]; then
  echo "Copying default configs"
  mkdir -p Configs
  cp DefaultConfigs/* Configs/
fi

if [ ! -f Storage/DefaultWorld ]; then
  echo "Copying default storage"
  mkdir -p Storage
  cp DefaultStorage/* Storage/
fi

echo "$ECO_VESRION" > Confgs/eco_version

mono EcoServer.exe -nogui
