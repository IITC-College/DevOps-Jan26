#! /bin/bash

source .env.db
source .env.volume
source .env.network

# Remove the container
if [ "$(docker ps -aq -f name=$DB_CONTAINER_NAME)" ]; then
  echo "Removing container $DB_CONTAINER_NAME"
  docker kill $DB_CONTAINER_NAME
  docker rm $DB_CONTAINER_NAME
else
  echo "Container does not exist. Skipping."
fi

# Remove the volume
if [ "$(docker volume ls -q -f name=$VOLUME_NAME)" ]; then
  echo "Removing volume $VOLUME_NAME"
  docker volume rm $VOLUME_NAME
else
  echo "Volume does not exist. Skipping."
fi

# Remove the network
if [ "$(docker network ls -q -f name=$NETWORK_NAME)" ]; then
  echo "Removing network $NETWORK_NAME"
  docker network rm $NETWORK_NAME
else
  echo "Network does not exist. Skipping."
fi

