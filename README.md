# ramso/testlink

Last version of [TestLink](http://testlink.org/) without embedded Mysql database and external configuration.
# Usage
`docker run -d --name testlink -p 9080:80 -v ~/testlink:/var/conf ramso/testlink`

# Setup
Access to the application in the url http://localhost:9080 , config the database with the setup wizard. 
After the first run in the folder mounted you have the **custom_config.inc.php**, modify and restart the container to enable the changes.
**Themes** folder contains items for testlink and loaded on every reboot
The **cfg** folder contain the cfg folder for customize the editors, constants, etc ...
