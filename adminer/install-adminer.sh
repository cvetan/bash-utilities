#!/bin/bash

sudo mkdir /usr/share/adminer;
sudo wget -q "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php;
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php;
echo "Alias /adminer /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf > /dev/null;
sudo a2enconf adminer.conf > /dev/null;
sudo systemctl reload apache2
sudo systemctl restart apache2

echo 'Adminer installation successfull. You can use it at: http://localhost/adminer'
