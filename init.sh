#!/bin/sh

copyconf() {
  if [ -s /var/conf/custom_config.inc.php ]
  then
    cp /var/conf/custom_config.inc.php /var/www/html
    chown www-data /var/www/html/custom_config.inc.php
  fi
  
  if [ -d /var/conf/themes ]
  then
    cp -r /var/conf/themes/* /var/www/html/gui/themes
    chown -R www-data /var/www/html/gui/themes
  fi
  
   if [ -d /var/conf/cfg ]
  then
    cp -r /var/conf/cfg/* /var/www/html/cfg
    chown -R www.data /var/www/html/cfg
  fi
}

createconf() {
  if [ ! -s /var/conf/custom_config.inc.php ]
  then
    cp /var/www/html/custom_config.inc.php.example /var/conf/custom_config.inc.php
  fi
    
  if [ ! -d /var/conf/themes ]
  then
    mkdir -p /var/conf/themes
    cp -r  /var/www/html/gui/themes/* /var/conf/themes
  fi

  if [ ! -d /var/conf/cfg ]
  then
    mkdir -p /var/conf/cfg
    cp -r  /var/www/html/cfg/* /var/conf/cfg
  fi
  copyconf
}

if [ -s /var/www/html/config_db.inc.php ]
then
  copyconf
else
  createconf
fi


