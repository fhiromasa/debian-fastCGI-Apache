#!/bin/bash
set -e

#mt settings
unzip /var/www/cgi-bin/MT7-R5402.zip -d /var/www/cgi-bin
mv /var/www/cgi-bin/MT7-R5402 /var/www/cgi-bin/mt
chmod 777 /var/www/
chmod 777 /var/www/cgi-bin
chmod 755 /var/www/cgi-bin/mt/*.cgi

service php7.4-fpm start
service apache2 start
