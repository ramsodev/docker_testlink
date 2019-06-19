FROM php:7.3-apache


ENV VERSION=1.9.19 SMTP_HOST='localhost' ADMIN_EMAIL='admin@example.com' FROM_EMAIL='testlink@example.com' RETURN_EMAIL='testlink@example.com' MAIL_PRIORITY=5 MAIL_METHOD=PHPMAILER_METHOD_SMTP SMTP_USERNAME='' SMTP_PASSWORD='' SMTP_CONNECTION_MODE='' SMTP_PORT='25' LDAP_SERVER='' LDAP_PORT='389' LDAP_VERSION='3' LDAP_ROOT_DN='' LDAP_BIND_DN='' LDAP_BIND_PASSWORD='' LDAP_TLS='' LDAP_UID='uid' SELF_SIGNUP=false LOGO_LOGIN='logo.png' LOGO_NAVBAR='logo.png' LOGIN_INFO='' CONFIG_CHECK='SILENT' DB_TYPE='mysql' DB_USER='testlink' DB_PASS='testlink' DB_HOST='localhost' DB_NAME='testlink' DB_TABLE_PREFIX='' ADMIN_USER='' ADMIN_EMAIL='admin@example.com' ADMIN_NAME='Testlink' ADMIN_LAST_NAME='Administrator' ADMIN_LOCALE='en_US'

RUN export DEBIAN_FRONTEND=noninteractive && \
   apt-get update && apt-get install -y mysql-client\
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libldap2-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/  \
    && docker-php-ext-install ldap

RUN mkdir -p  /var/conf

RUN a2enmod authnz_ldap && a2enmod ldap

RUN  curl -L https://github.com/TestLinkOpenSourceTRMS/testlink-code/archive/$VERSION.tar.gz -o testlink.tar.gz

RUN tar xvzf testlink.tar.gz --directory /var/tmp && \
    mv /var/tmp/testlink* /var/www/html/testlink && \
     rm testlink.tar.gz

RUN mkdir -p /var/testlink/logs && mkdir -p /var/testlink/upload_area && chown -R www-data /var/testlink

RUN chown -R www-data /var/www/html

VOLUME /var/conf

COPY config_db.sh customer_config.sh docker-testlink-entrypoint /usr/local/bin/

RUN chmod +x /usr/local/bin/*

ENTRYPOINT ["docker-testlink-entrypoint"]

WORKDIR /var/www/html

CMD ["apache2-foreground"]
