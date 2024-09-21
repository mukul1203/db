#!/bin/bash

# Replace <container_name> with the name or ID of your Docker container
CONTAINER_NAME="mysql-db"

# Check if the container exists (stopped or running)
if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    # Check if the container is running
    if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
        echo "Container $CONTAINER_NAME is already running."
    else
        echo "Starting container $CONTAINER_NAME..."
        docker start $CONTAINER_NAME
        echo "Container $CONTAINER_NAME started."
    fi
else
    echo "Container $CONTAINER_NAME does not exist."
fi
