#!/bin/bash

service mysql start

if [ ! -f /var/app/.installed ]; then
    mkdir /var/app/webroot
    mv /var/www/html /var/www/html-dist
    ln -s /var/app/webroot /var/www/html
    [ -x /var/app/scripts/install.sh ] && /var/app/scripts/install.sh
    touch /var/app/.installed
fi

[ -x /var/app/scripts/update.sh ] && /var/app/scripts/update.sh
service apache2 start
tail -f -n+1 /var/log/apache2/access.log
