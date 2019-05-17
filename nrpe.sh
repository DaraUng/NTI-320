#!/bin/bash
yum install -y nagios-nrpe-server nagios-plugins nrpe nagios-plugins-load nagios-plugins-ping nagios-plugins-disk nagios-plugins-http nagios-plugins-procs wget
# BUG:https://osric.com/chris/accidental-developer/2016/12/missing-nagios-plugins-in-centos-7/ (nrpe plugins have been packaged seperately and don't install with nagios-plugins-all)
# BUG #2 https://cloudwafer.com/blog/installing-nagios-agent-npre-on-centos/ (the nrpe config is commented out and checks are not defined)
# Use sed statments to uncomment NRPE config and add the appropiate flags
# add in command[check_mem]=/usr/lib64/nagios/plugins/check_mem.sh
# Install custom mem monitor
wget -O /usr/lib64/nagios/plugins/check_mem.sh https://raw.githubusercontent.com/nic-instruction/NTI-320/master/nagios/check_mem.sh
chmod +x /usr/lib64/nagios/plugins/check_mem.sh
systemctl enable nrpe
systemctl start nrpe

#make sure to change the ip to the server ipaddress.
sed -i 's/allowed_hosts=127.0.0.1/allowed_hosts=127.0.0.1, 10.138.15.217/g' /etc/nagios/nrpe.cfg
sed -i 's,command[check_hda1]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/hda1,command[check_disk]=/usr/lib64/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1,g' /etc/nagios/nrpe.cfg

#restart the nrpe
systemctl restart nrpe

# Troubleshooting
# From nagios server: /usr/lib64/nagios/plugins/check_nrpe -H 10.0.0.3 -c check_load From NRPE server execute the command in libexec /usr/lib64/nagios/plugins/
