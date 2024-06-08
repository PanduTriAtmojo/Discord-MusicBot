#!/bin/sh

# Start Lavalink in the background
java -jar /opt/Lavalink.jar &

# Wait for Lavalink to start
sleep 10

# Check if Lavalink port is open
if netstat -tuln | grep 8080; then
  echo "Lavalink is running on port 8080"
else
  echo "Lavalink is not running"
  exit 1
fi

# Start Node.js application
node index.js
