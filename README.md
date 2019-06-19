# ramso/testlink

Last version of [TestLink](http://testlink.org/) without embedded Mysql database, env var config and external themes.
# Usage
`docker run -d --name testlink -p 9080:80 -v ~/testlink:/var/conf ramso/testlink`

# Setup

Variable Name  | Description   | Activate  | Default value
--|---|--|--  
SMTP_HOST| SMTP server delivers a generated email.  | False |localhost
ADMIN_EMAIL| Email address of administrator  | False |admin@example.com
FROM_EMAIL| Email address of sender  | False |testlink@example.com
RETURN_EMAIL| Email for response  | False |testlink@example.com
 MAIL_PRIORITY| Optionally you can set priority of email: - Urgent = 1 - Not Urgent = 5 - Disable = 0  | False |5
MAIL_METHOD| Method using for send emails  | False |PHPMAILER_METHOD_SMTP
SMTP_USERNAME| The user of a secure smtp connection  | False |
SMTP_PASSWORD|   | False |
SMTP_CONNECTION_MODE|  indicate if use tls or not | False |
SMTP_PORT| the port of teh smtp server   | False |25
LDAP_SERVER| The name or ip of the LDAP server. If balnk the authetication method is MD5  | False |
LDAP_PORT| The port of the server  | False |
LDAP_VERSION|  The ldap version | False |
LDAP_ROOT_DN| The root dn of yout ldap users   | False |
LDAP_BIND_DN| Yhe bind db of the user for connect  | False |
LDAP_BIND_PASSWORD|   | False |
LDAP_TLS| Boolen for indicate if TLS is used for connect  | False |false
LDAP_UID| the uid fiel of youir LDAP users   | False |uid
SELF_SIGNUP| Allows new users to create accounts with default role by "New user" link on login page | False |false
LOGO_LOGIN| The image for login page   | False |logo.png
LOGO_NAVBAR| The image for the navigation bar  | False |logo.png
LOGIN_INFO| Text information for the login page   | False |
CONFIG_CHECK| Display config checks  | False |SILENT
DB_TYPE| Type of the db. Actualy only mysql are supported with the config of this container  | False |mysql
DB_USER| DB user   | False |testlink
DB_PASS| Db password  | False |testlink
DB_HOST| DB Server name or ip   | False |localhost
DB_NAME| DB Name  | False |testlink
DB_TABLE_PREFIX| Table prefix  | False |
ADMIN_USER| If not blank create a user with admin role and desactivate the default admin. Use only with LDAP authentication method because not create the password.   | True |
ADMIN_NAME| The first name of the new admin  | False |
ADMIN_LAST_NAME| The last name of the new admin  | False |
ADMIN_LOCALE| The locale for the new admin user.  | False |en_US

in the /var/conf volume put the themes and config files to copy to default folder

**Themes** folder contains items for testlink and loaded on every reboot
The **cfg** folder contain the cfg folder for customize the editors, constants, etc ...

## Missing options
- Not apply the DB updates.
- Not support OAUTH config
