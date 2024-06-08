#!/bin/sh

# Start Lavalink in the background
java -jar /opt/Lavalink/Lavalink.jar &

# Wait for Lavalink to start
sleep 20

# Start Node.js application
node index.js
