#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo apt update
sudo apt install apache2 -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo systemctl restart apache2
cd /tmp
sudo curl -O https://wordpress.org/latest.tar.gz
sudo tar xzvf latest.tar.gz
sudo touch /tmp/wordpress/.htaccess
sudo cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
sudo rm /var/www/html/index.html
sudo mkdir /tmp/wordpress/wp-content/upgrade
sudo cp -a /tmp/wordpress/. /var/www/html
sudo chown -R www-data:www-data /var/www/html
sudo find /var/www/html/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/ -type f -exec chmod 640 {} \;
sudo curl -s https://api.wordpress.org/secret-key/1.1/salt/
# Replace the database values in the wp-config.php file
#!/bin/bash -xe
sudo sed -i "s/database_name_here/${db_name}/g" /var/www/html/wp-config.php
sudo sed -i "s/username_here/${db_user}/g" /var/www/html/wp-config.php
sudo sed -i "s/password_here/${db_password}/g" /var/www/html/wp-config.php
sudo sed -i "s/localhost/${db_host}/g" /var/www/html/wp-config.php


