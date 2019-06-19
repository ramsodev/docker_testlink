#!/bin/sh

echo '<?php' > /var/www/html/testlink/custom_config.inc.php;

echo "\$g_smtp_host        = '$SMTP_HOST';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_smtp_port = $SMTP_PORT;" >> /var/www/html/testlink/custom_config.inc.php
if [ ! -z "$SMTP_USERNAME" ]
then
    echo "\$g_smtp_username    = '$SMTP_USERNAME';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$g_smtp_password    = '$SMTP_PASSWORD';" >> /var/www/html/testlink/custom_config.inc.php
fi
echo "\$g_smtp_connection_mode = '$SMTP_CONNECTION_MODE';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_tl_admin_email     = '$ADMIN_EMAIL';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_from_email         = '$FROM_EMAIL';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_return_path_email  = '$RETURN_EMAIL';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_mail_priority = $MAIL_PRIORITY;" >> /var/www/html/testlink/custom_config.inc.php
echo "\$g_phpMailer_method = $MAIL_METHOD;" >> /var/www/html/testlink/custom_config.inc.php

if [ ! -z "$LDAP_SERVER" ]
then
    echo "\$tlCfg->authentication['method'] = 'LDAP';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_server'] = '$LDAP_SERVER';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_port'] = '$LDAP_PORT';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_version'] = '$LDAP_VERSION';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_root_dn'] = '$LDAP_ROOT_DN';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_bind_dn'] = '$LDAP_BIND_DN';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_bind_passwd'] = '$LDAP_BIND_PASSWORD';" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_tls'] = $LDAP_TLS;" >> /var/www/html/testlink/custom_config.inc.php
    echo "\$tlCfg->authentication['ldap'][1]['ldap_uid_field'] = '$LDAP_UID';" >> /var/www/html/testlink/custom_config.inc.php
fi
echo "\$tlCfg->user_self_signup = $SELF_SIGNUP;" >> /var/www/html/testlink/custom_config.inc.php
echo "\$tlCfg->logo_login = '$LOGO_LOGIN';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$tlCfg->logo_navbar = '$LOGO_NAVBAR';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$tlCfg->login_info = '$LOGIN_INFO';" >> /var/www/html/testlink/custom_config.inc.php
echo "\$tlCfg->config_check_warning_mode = '$CONFIG_CHECK';" >> /var/www/html/testlink/custom_config.inc.php
chown www-data /var/www/html/testlink/custom_config.inc.php
