
#!/bin/bash
#https://www.tecmint.com/install-rsyslog-centralized-logging-in-centos-ubuntu/

sudo yum -y update && yum -y install rsyslog

systemctl start rsyslog
systemctl enable rsyslog

#copy the rsyslog.conf to .bak
cp /etc/rsyslog.conf /etc/rsyslog.conf.bak

#Search for the ####### and replace with ##### in the /etc/rsyslog.conf

sed -i 's,#$ModLoad imudp,\$ModLoad imudp,g' /etc/rsyslog.conf
sed -i 's,#$UDPServerRun 514\,$UDPServerRun 514,g' /etc/rsyslog.conf
sed -i 's,#$ModLoad imtcp\,$ModLoad imtcp,g' /etc/rsyslog.conf
sed -i 's,#$InputTCPServerRun 514\,$InputTCPServerRun 514,g' /etc/rsyslog.conf


systemctl restart rsyslog
systemctl status rsyslog
