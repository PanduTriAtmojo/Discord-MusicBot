# Menggunakan base image node dan bullseye
FROM node:lts-buster

# Install dependencies untuk Lavalink dan tools untuk memeriksa port
RUN apt-get update && \
    apt-get install -y wget net-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
# WORKDIR /usr/src/app

# Copy aplikasi Node.js ke dalam container
COPY . .

# Install dependencies aplikasi Node.js
RUN npm install && npm i -g pm2

# Jalankan build aplikasi (jika ada)
# RUN npm run deploy

# Download dan setup Lavalink (dikomentari jika tidak diperlukan)
# RUN wget https://github.com/lavalink-devs/Lavalink/releases/download/3.7.12/Lavalink.jar

# Set environment variable untuk Lavalink (dikomentari jika tidak diperlukan)
# ENV JAVA_TOOL_OPTIONS -Xmx1G

# Copy entrypoint script dan set izin eksekusi
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

# Set entrypoint
ENTRYPOINT ["./entrypoint.sh"]

# CMD ["node", "index.js"]
