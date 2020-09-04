#!/bin/bash

source scripts/main_menu.sh

function display_adminer_menu() {
    echo '[1] Install adminer'
    echo '[2] Update adminer'
    echo '[3] Uninstall adminer'

    read selected

    if [[ $selected == '1' ]]; then
        adminer_install
    elif [[ $selected == '2' ]]; then
        adminer_update
    elif [[ $selected == '3' ]]; then
        adminer_uninstall
    else
        echo 'You must selected one of the folowing: '
        display_adminer_menu
    fi
}

function adminer_install() {
    if [[ -d '/usr/share/adminer' ]]; then
        echo 'Adminer is already installed. Maybe run update?'
        display_adminer_menu
    fi
    sudo mkdir /usr/share/adminer;
    wget -q "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php;
    ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php;
    echo "Alias /adminer /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf > /dev/null;
    a2enconf adminer.conf > /dev/null;
    systemctl reload apache2
    systemctl restart apache2

    echo 'Adminer installed successfully.'
}

function adminer_update() {
    sudo wget -q "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php;

    echo 'Adminer updated successfully.';

    display_main_menu
}

function adminer_uninstall() {
    sudo a2disconf adminer.conf > /dev/null;
    systemctl reload apache2;
    systemctl restart apache2;
    rm /etc/apache2/conf-available/adminer.conf;
    rm -Rf /usr/share/adminer;

    echo 'Adminer uninstalled successfully.';

    display_main_menu
}
