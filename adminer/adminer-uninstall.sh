#!/bin/bash

sudo a2disconf adminer.conf > /dev/null;
sudo systemctl reload apache2;
sudo systemctl restart apache2;
sudo rm /etc/apache2/conf-available/adminer.conf;
sudo rm -Rf /usr/share/adminer;

echo 'Adminer uninstalled successfully.';
