#!/bin/sh

# Start Lavalink in the background
java -jar Lavalink.jar &

# Wait for Lavalink to start
sleep 10

# Check if Lavalink port is open
if netstat -tuln | grep 2333; then
  echo "Lavalink is running on port 2333"
else
  echo "Lavalink is not running"
  exit 1
fi

# Start Node.js application
node index.js
