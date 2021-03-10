#!/bin/sh

mysql_install_db --user=root --datadir=/var/lib/mysql/
sed -i 's/^skip-networking/#&/' /etc/my.cnf.d/mariadb-server.cnf

/start.sh &
/usr/bin/mysqld_safe --datadir="/var/lib/mysql/"
