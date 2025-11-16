# 1. Empezar con la imagen oficial de WordPress
FROM wordpress:latest

# 2. Instalar las dependencias de sistema para PostgreSQL
RUN apt-get update && \
    apt-get install -y \
    libpq-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# 3. Instalar la extensión PHP para PostgreSQL (la que te falta)
RUN docker-php-ext-install pgsql pdo_pgsql

# 4. Copiar los archivos del plugin (que ya tienes localmente)
# Copia la carpeta del plugin
COPY ./pg4wp /var/www/html/wp-content/pg4wp/
# Copia el archivo driver
COPY ./pg4wp/db.php /var/www/html/wp-content/db.php