
#!/bin/bash
#https://www.tecmint.com/install-rsyslog-centralized-logging-in-centos-ubuntu/

sudo yum -y update && yum -y install rsyslog

systemctl start rsyslog
systemctl enable rsyslog

#copy the rsyslog.conf to .bak
cp /etc/rsyslog.conf /etc/rsyslog.conf.bak

#Search for the ####### and replace with ##### in the /etc/rsyslog.conf

sed -i 's/\#$ModLoad imudp,/\$ModLoad imudp,g' /etc/rsyslog.conf
sed -i 's/\#$UDPServerRun 514,/\$UDPServerRun 514,g' /etc/rsyslog.conf
sed -i 's/\#$ModLoad imtcp\$ModLoad imtcp,g' /etc/rsyslog.conf
sed -i 's/\#$InputTCPServerRun 514,/\$InputTCPServerRun 514,g' /etc/rsyslog.conf

#sed -i 's,#command\[check_mem\]=/usr/lib64/nagios/plugins/custom_check_mem -n \$ARG1\$,command\[check_mem\]=/usr/lib64/nagios/plugins/check_mem.sh -w 80 -c 90,g' /etc/nagios/nrpe.cfg
sed -i "s/\$database_username = 'cactiuser';/\$database_username = 'cacti';/" /etc/cacti/db.php


systemctl restart rsyslog
systemctl status rsyslog
