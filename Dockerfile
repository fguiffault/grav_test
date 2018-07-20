FROM php:7.0-apache

# Based on the official Wordpress docker file

# Versions.
ENV GRAV_VERSION 1.4.7

RUN a2enmod rewrite expires

# install the PHP extensions we need
RUN apt-get update && apt-get install -y git unzip libpng-dev libjpeg-dev zlib1g-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mysqli opcache zip mbstring

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

# Installation de Grav et de plugins.
# Liste des plugins :
# 	- Git Sync
#	- TinyMCE Editor Integration
# 	- Admin Addon User Manager
# 	- Bootstrapper
RUN curl -o grav-admin-v${GRAV_VERSION}.zip -SL https://github.com/getgrav/grav/releases/download/${GRAV_VERSION}/grav-admin-v${GRAV_VERSION}.zip && \
	mkdir -p /tmp/grav-admin && \
	unzip grav-admin-v${GRAV_VERSION}.zip -d /tmp && \
	rsync -a /tmp/grav-admin/ /var/www/html && \
	/var/www/html/bin/grav install && \
	bin/gpm -y install git-sync && \
	bin/gpm -y install tinymce-editor && \
	bin/gpm -y install admin-addon-user-manager && \
	bin/gpm -y install bootstrapper && \
	chown -R www-data:www-data /var/www/html

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
