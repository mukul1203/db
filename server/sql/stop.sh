#!/bin/bash

# Replace <image_name_or_id> with your SQL Docker image
IMAGE_NAME="mysql"

# Get the container ID of the running container
CONTAINER_ID=$(docker ps -q --filter "ancestor=$IMAGE_NAME")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping container $CONTAINER_ID..."
  docker stop "$CONTAINER_ID"
#   echo "Removing container $CONTAINER_ID..."
#   docker rm "$CONTAINER_ID"
  echo "Container stopped."
else
  echo "No running container found for image: $IMAGE_NAME"
fi

