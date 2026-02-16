#! /bin/bash

source .env.network
source .env.db
source .env.volume

if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
  echo "Volume already exists. Skipping creation."
else
  docker volume create $VOLUME_NAME
  echo "Volume $VOLUME_NAME created"
fi

if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
  echo "Network already exists. Skipping creation."
else
  docker network create $NETWORK_NAME
  echo "Network $NETWORK_NAME created"
fi