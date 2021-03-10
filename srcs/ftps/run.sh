#!/bin/sh

sed -i s/FTPS_IP/$FTPS_IP/g /etc/vsftpd/vsftpd.conf;

adduser -D $FTPS_USER && echo "$FTPS_USER:$FTPS_PASSWORD" | chpasswd
chown -R $FTPS_USER /home/$FTPS_USER

mv fichiertest.txt /home/user

vsftpd /etc/vsftpd/vsftpd.conf