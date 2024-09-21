#!/bin/bash

# Replace <container_name> with the name of your Docker container
CONTAINER_NAME="mysql-db"

# Check if the container exists
if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    echo "Warning: Destroying container $CONTAINER_NAME will remove the container and everything inside it (including any installations like Git)."
    read -p "Do you want to proceed? (y/n): " -n 1 -r
    echo    # Move to the next line
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Stopping container $CONTAINER_NAME..."
        docker stop $CONTAINER_NAME

        echo "Removing container $CONTAINER_NAME..."
        docker rm $CONTAINER_NAME

        # Optionally remove the associated volume
        # Uncomment the next line if you want to remove the volume too
        # docker volume rm <your_volume_name>

        echo "Container $CONTAINER_NAME has been destroyed."
    else
        echo "Operation canceled. The container has not been destroyed."
    fi
else
    echo "Container $CONTAINER_NAME does not exist."
fi
