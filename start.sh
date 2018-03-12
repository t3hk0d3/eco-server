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

mono EcoServer.exe -nogui
