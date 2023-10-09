# Usa una imagen base de PHP con Apache
FROM php:7.4-apache

# Habilita el módulo de Apache mod_rewrite
RUN a2enmod rewrite

# Copia los archivos de la aplicación Laravel al contenedor
COPY . /var/www/html

# Establece el directorio de trabajo en la carpeta de la aplicación Laravel
WORKDIR /var/www/html

# Instala las extensiones de PHP necesarias para Laravel
RUN docker-php-ext-install pdo pdo_mysql

# Instala Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Instala las dependencias de PHP de tu proyecto Laravel
RUN composer install

# Expone el puerto 80 para el servidor web de Apache
EXPOSE 80

# Ejecuta Apache en primer plano
CMD ["apache2-foreground"]
