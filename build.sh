#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

BASE_IMAGE_FILE="image_info.txt"

if [ ! -f "$BASE_IMAGE_FILE" ]; then
    echo "Error: $BASE_IMAGE_FILE not found!"
    exit 1
fi

# Read the base image name and tag
IMAGE_NAME=$(sed -n '1p' "$BASE_IMAGE_FILE")
IMAGE_TAG=$(sed -n '2p' "$BASE_IMAGE_FILE")
echo $IMAGE_NAME
echo $IMAGE_TAG

if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_TAG" ]; then
    echo "Error: Base image name or tag is empty in $BASE_IMAGE_FILE"

fi

# Step 4: Build the Docker image
DOCKER_IMAGE_TAG="svitla-test"

docker build --build-arg IMAGE_NAME="$IMAGE_NAME" --build-arg IMAGE_TAG="$IMAGE_TAG" -t "$DOCKER_IMAGE_TAG" .

echo "Docker image $IMAGE_NAME built successfully."
