# Menggunakan base image node dan buster
FROM node:lts-buster

# Install dependencies untuk Lavalink
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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
RUN wget https://github.com/lavalink-devs/Lavalink/releases/download/4.0.6/Lavalink.jar

# Set environment variable untuk Lavalink
ENV JAVA_TOOL_OPTIONS -Xmx1G

# Copy entrypoint script
COPY entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod +x /usr/src/app/entrypoint.sh

# Set working directory kembali ke aplikasi Node.js
WORKDIR /usr/src/app

# Set entrypoint
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
