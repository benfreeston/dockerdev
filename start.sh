#!/bin/bash

source ./config.sh

# Check if source and destination are the same
if [ "app/bantham_ai" != "$APP_PATH" ]; then
  # Rename the folder app/bantham_ai to app/IMAGE_NAME if they are different
  mv "app/bantham_ai" "$APP_PATH"
else
  echo "Source and destination are the same, skipping mv"
fi

# Function to remove an existing container if it exists
remove_existing_container() {
  container_name=$1
  if [ "$(docker ps -aq -f name=$container_name)" ]; then
    echo "Removing existing container: $container_name"
    docker rm -f $container_name
  fi
}

# Build the Docker image if not already built
docker build -t $IMAGE_NAME .

# Remove existing container if it exists
remove_existing_container $CONTAINER_NAME

# Parse the command line argument
case "$1" in
  jupyter)
    docker run -it -p 8888:8888 --name $CONTAINER_NAME -v $(pwd)/app:/app -v ~/.aws:/root/.aws $IMAGE_NAME jupyter
    ;;
  dash)
    docker run -it -p 8050:8050 --name $CONTAINER_NAME -v $(pwd)/app:/app -v ~/.aws:/root/.aws $IMAGE_NAME dash
    ;;
  flask)
    docker run -it -p 5000:5000 --name $CONTAINER_NAME -v $(pwd)/app:/app -v ~/.aws:/root/.aws $IMAGE_NAME flask
    ;;
  bash)
    docker run -it -v $(pwd)/app:/app -v ~/.aws:/root/.aws $IMAGE_NAME bash
    ;;
  *)
    echo "Usage: $0 {jupyter|dash|flask|bash}"
    exit 1
esac
