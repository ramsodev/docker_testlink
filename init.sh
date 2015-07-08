#!/bin/sh

copyconf() {
  if [ -s /var/conf/custom_config.inc.php ]
  then
    cp /var/conf/custom_config.inc.php /var/www/html/testlink/
    chown www-data /var/www/html/testlink/custom_config.inc.php
  fi
  
  if [ -d /var/conf/themes ]
  then
    cp -r /var/conf/themes/* /var/www/html/testlink/gui/themes
    chown -R www-data /var/www/html/testlink/gui/themes
  fi
  
   if [ -d /var/conf/cfg ]
  then
    cp -r /var/conf/cfg/* /var/www/html/testlink/cfg
    chown -R www.data /var/www/html/testlink/cfg
  fi
 
  if [ -s /var/conf/config_db.inc.php ] 
  then  
      cp /var/conf/config_db.inc.php /var/www/html/testlink/config_db.inc.php
  else
      cp /var/www/html/testlink/config_db.inc.php /var/conf/config_db.inc.php
  fi
  if [ -s /var/conf/config.inc.php ] 
  then  
      cp /var/conf/config.inc.php /var/www/html/testlink/config.inc.php
  else
      cp /var/www/html/testlink/config.inc.php /var/conf/config.inc.php
  fi
 
}

createconf() {
  if [ ! -s /var/conf/custom_config.inc.php ]
  then
    cp /var/www/html/testlink/custom_config.inc.php.example /var/conf/custom_config.inc.php
  fi
    
  if [ ! -d /var/conf/themes ]
  then
    mkdir -p /var/conf/themes
    cp -r  /var/www/html/testlink/gui/themes/* /var/conf/themes
  fi

  if [ ! -d /var/conf/cfg ]
  then
    mkdir -p /var/conf/cfg
    cp -r  /var/www/html/testlink/cfg/* /var/conf/cfg
  fi
  
  copyconf
}

if [ -s /var/www/html/testlink/config_db.inc.php ]
then
  if [ -d /var/www/html/testlink/install ]
  then
    rm -r /var/www/html/testlink/install
  fi
  copyconf
else
  createconf
fi


