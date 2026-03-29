# Menggunakan Java 21 (wajib untuk Minecraft 1.21 ke atas)
FROM openjdk:21-slim

WORKDIR /app

# Install curl untuk mengambil file server
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Download PaperMC 1.21.11 langsung ke server Zeabur
RUN curl -L -o paper.jar https://fill-data.papermc.io/v1/objects/e708e8c132dc143ffd73528cccb9532e2eb17628b1a0eee74469bf466c7003f8/paper-1.21.11-116.jar

# Copy settingan dari GitHub (eula.txt & server.properties)
COPY . .

# Jalankan server. 
# -Xmx1024M artinya pakai RAM maksimal 1GB. 
# Kalau Zeabur kamu lemot, bisa coba ganti jadi 512M.
CMD ["java", "-Xmx1024M", "-Xms512M", "-jar", "paper.jar", "nogui"]
