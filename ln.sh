#!/bin/bash

declare -a arr=("maps" "materials" "models" "panorama" "particles" "resources" "scenes" "scripts")

me=$(whoami)

for i in "${arr[@]}"

do
        echo "$i"

        sudo ln -s /home/$me/ftp/server/csgoserver/serverfiles/csgo/$i /var/www/html/fastdl
done 

if [ ! grep -F "<Directory /var/www/html/fastdl" /etc/apache2/sites-available/000-default.conf ]; then

        echo "<Directory /var/www/html/fastdl>" >> /etc/apache2/sites-available/000-default.conf
        echo "Allow from all" >> /etc/apache2/sites-available/000-default.conf
        echo "</Directory>" >> /etc/apache2/sites-available/000-default.conf
        sudo service apache2 restart

fi
