#!/bin/bash
mkdir -p /var/run/vsftpd/empty

chmod a-w -R /var/run/vsftpd/empty
chmod 775 -R $PATH_WORDPRESS

envsubst < /etc/vsftpd.conf.template > /etc/vsftpd.conf

if [ -z "$FTP_USER" ]; then
    echo "Erreur : la variable d'environnement FTP_USER n'est pas définie."
    exit 1
fi

if [ -z "$FTP_PASS" ]; then
    echo "Erreur : la variable d'environnement FTP_PASS n'est pas définie."
    exit 1
fi


useradd -m -g www-data "$FTP_USER" && echo "$FTP_USER:$FTP_PASS" | chpasswd
chmod 775 -R /home/$FTP_USER


echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null

/usr/sbin/vsftpd /etc/vsftpd.conf
