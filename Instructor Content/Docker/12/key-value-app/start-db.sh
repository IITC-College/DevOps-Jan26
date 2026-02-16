#! /bin/bash

# Start the MongoDB container
MONGODB_IMAGE="mongodb/mongodb-community-server"
MONGODB_TAG="7.0-ubuntu2204"
source .env.db

# Root credentials
ROOT_USER="root-user"
ROOT_PASSWORD="root-password"

# Key-value database credentials
KEY_VALUE_DB="key-value-db"
KEY_VALUE_USER="key-value-user"
KEY_VALUE_PASSWORD="key-value-password"

# Ports
LOCALHOST_PORT=27017
CONTAINER_PORT=27017

# Network
source .env.network
NETWORK_NAME="key-value-net"

# Volumes
source .env.volume
VOLUME_NAME="key-value-volume"
VOLUME_CONTAINER_PATH="/data/db"

# Setup the environment
source setup.sh

# Check if the container already exists
if [ "$(docker ps -q -f name=$DB_CONTAINER_NAME)" ]; then
  echo "Container already exists."
  echo "To stop it run: docker kill $DB_CONTAINER_NAME"
  exit 1
fi

# Start the container
docker run -d --rm --name $DB_CONTAINER_NAME \
    -e MONGO_INITDB_ROOT_USERNAME=$ROOT_USER \
    -e MONGO_INITDB_ROOT_PASSWORD=$ROOT_PASSWORD \
    -e KEY_VALUE_DB=$KEY_VALUE_DB \
    -e KEY_VALUE_USER=$KEY_VALUE_USER \
    -e KEY_VALUE_PASSWORD=$KEY_VALUE_PASSWORD \
    -p $LOCALHOST_PORT:$CONTAINER_PORT \
    --network $NETWORK_NAME \
    -v $VOLUME_NAME:$VOLUME_CONTAINER_PATH \
    -v ./db-config/mongo-init.js:/docker-entrypoint-initdb.d/mongo-init.js:ro \
    $MONGODB_IMAGE:$MONGODB_TAG 

# Wait few seconds to let the container start
echo "Waiting for the container to start..."
sleep 5

# Check if the container is running
if [ $(docker ps -q -f name=$DB_CONTAINER_NAME) ]; then
  echo "Container $CONTAINER_NAME is running"
  echo "Root user: $ROOT_USER"
  echo "Root password: $ROOT_PASSWORD"
else
  echo "Container $CONTAINER_NAME is not running"
fi