#!/bin/sh

until mysql
do
	sleep 0.5
done

mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -u root -e "GRANT ALL ON *.* TO \`$MYSQL_ROOT\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;"
mysql -u root -e "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO \`$MYSQL_USER\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"
