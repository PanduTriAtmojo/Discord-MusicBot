# Menggunakan base image node dan alpine
FROM node:17.9.1-alpine

# Install dependencies untuk Lavalink
RUN apk add --no-cache openjdk17-jdk wget

# Set working directory
WORKDIR /usr/src/app

# Copy aplikasi Node.js ke dalam container
COPY . .

# Install dependencies aplikasi Node.js
RUN npm install

# Jalankan build aplikasi (jika ada)
RUN npm run deploy

# Download dan setup Lavalink
WORKDIR /opt
RUN wget https://github.com/Frederikam/Lavalink/releases/download/3.4/Lavalink.jar

# Set environment variable untuk Lavalink
ENV JAVA_TOOL_OPTIONS -Xmx1G

# Copy entrypoint script
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Set working directory kembali ke aplikasi Node.js
WORKDIR /usr/src/app

# Set entrypoint
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
