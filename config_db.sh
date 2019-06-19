#!/bin/sh
#Añadir ejecución de script update en /var/www/html/testlink/installed/sql/alter_tables/$VERSION/mysql/DB.$VERSION/*/*
#reemplazr en los ficheros /*prefix*/


echo "<?php " > /var/www/html/testlink/config_db.inc.php;
echo "define('DB_TYPE', '$DB_TYPE');" >> /var/www/html/testlink/config_db.inc.php;
echo "define('DB_USER', '$DB_USER');" >> /var/www/html/testlink/config_db.inc.php;
echo "define('DB_PASS', '$DB_PASS');" >> /var/www/html/testlink/config_db.inc.php;
echo "define('DB_HOST', '$DB_HOST');" >> /var/www/html/testlink/config_db.inc.php;
echo "define('DB_NAME', '$DB_NAME');" >> /var/www/html/testlink/config_db.inc.php;
echo "define('DB_TABLE_PREFIX', '$DB_TABLE_PREFIX');" >> /var/www/html/testlink/config_db.inc.php;

chown www-data /var/www/html/testlink/config_db.inc.php

echo "mysql -u root --password=admin -h $DB_HOST -b $DB_NAME";
if [  -d /var/www/html/testlink/install ]
then
    until mysql -u root --password=admin -h $DB_HOST  -e ";" ; do
      echo "Sin conexion con la DB, esperando 30 s...."
      sleep 30
    done
    db_version=$(  mysql --user=$DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME -se "select substr(version,-(length(version)-3)) from db_version");
    echo $db_version;
    if [ -z "$db_version" ]
    then
      echo "Creando DB";
      mysql -u root --password=admin -h $DB_HOST -b $DB_NAME -v < /var/www/html/testlink/install/sql/mysql/testlink_create_tables.sql;
      echo "Tablas creadas";
      mysql -u root --password=admin -h $DB_HOST -b $DB_NAME -v < /var/www/html/testlink/install/sql/mysql/testlink_create_default_data.sql;
      echo "Añadidos datos";
      if [ ! -z "$ADMIN_USER" ]
      then
        mysql --user=$DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME -e "INSERT INTO users (login,password,role_id,email,first,last,locale,default_testproject_id,active,script_key,cookie_string,auth_method,creation_ts,expiration_date) VALUES ('$ADMIN_USER','',8,'$ADMIN_EMAIL','$ADMIN_NAME','$ADMIN_LAST_NAME','$ADMIN_LOCALE',null,true,null,'b421f5454050c73e5ae6dbcd8ec61defe89c57e579e9ecf5cc4ff4626952533b','',NOW(),null)";
        mysql --user=$DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME -e "UPDATE users SET active=false WHERE login = 'admin'";
        echo "Añadido usuario Administrador";
      fi
    fi
fi
