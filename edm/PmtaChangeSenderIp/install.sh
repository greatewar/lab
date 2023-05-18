#!/bin/bash

# Define variables
APP_NAME="PmtaChangeSenderIp"
DOWNLOAD_URL="https://raw.githubusercontent.com/greatewar/lab/main/edm/PmtaChangeSenderIp/PmtaChangeSenderIp"
SYSTEM_DIR="/usr/local/bin"

echo "Starting $APP_NAME installation..."

# Check if app already exists in system directory
if [ -f "$SYSTEM_DIR/$APP_NAME" ]; then
  echo "Removing existing $APP_NAME from $SYSTEM_DIR..."
  rm -f "$SYSTEM_DIR/$APP_NAME"
fi

# Download app and save to system directory
echo "Downloading $APP_NAME from $DOWNLOAD_URL..."
curl -o "$SYSTEM_DIR/$APP_NAME" "$DOWNLOAD_URL"
echo "Download complete."

# Set executable permission for app
echo "Setting executable permission for $APP_NAME..."
chmod +x "$SYSTEM_DIR/$APP_NAME"
echo "Installation complete. $APP_NAME is ready to use!"
