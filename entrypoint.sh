#!/bin/sh

# Start Lavalink in the background
java -jar Lavalink.jar &

# Wait for Lavalink to start
sleep 20

# Start Node.js application
pm2-runtime start ecosystem.config.cjs