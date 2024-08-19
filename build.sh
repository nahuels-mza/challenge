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
echo $BA
echo $IMAGE_TAG

if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_TAG" ]; then
    echo "Error: Base image name or tag is empty in $BASE_IMAGE_FILE"

fi


# Step 2: Clone the GitHub repo
REPO_URL="https://github.com/nrupendesai/debugApp"
REPO_DIR="debugApp"

if [ -d "$REPO_DIR" ]; then
    rm -rf "$REPO_DIR"
fi

git clone "$REPO_URL" "$REPO_DIR"

# Replace the base image in the Dockerfile
DOCKERFILE_PATH="$REPO_DIR/Dockerfile"
sed -i '' "s|^FROM .*|FROM $IMAGE_NAME:$IMAGE_TAG|" "$DOCKERFILE_PATH"

# Step 4: Build the Docker image
IMAGE_NAME="svitla-test"

docker build -t "$IMAGE_NAME" "$REPO_DIR"

echo "Docker image $IMAGE_NAME built successfully."
