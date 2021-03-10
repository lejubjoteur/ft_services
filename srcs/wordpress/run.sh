#!/bin/sh

wp core install --url=http://${WORDPRESS_IP}:5050 --title="FT SERVICES IS THE BEST (#FAKENEWS)" --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=qgimenez@student.42.fr --path=/www/wordpress --allow-root
wp user create bob bob@example.com --role=author --user_pass=bob --path=/www/wordpress --allow-root
wp user create billy billy@example.com --role=subscriber --user_pass=billy --path=/www/wordpress --allow-root
wp user create jean jean@example.com --role=contributor --user_pass=jean --path=/www/wordpress --allow-root
wp user list --path=/www/wordpress --allow-root

php-fpm7
nginx