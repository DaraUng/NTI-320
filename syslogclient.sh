
#!/bin/bash

#client automation (postgres-a):
yum -y update && yum -y install rsyslog
systemctl start rsyslog
systemctl enable rsyslog

systemctl restart rsyslog
echo "*.* @@rsyslog-03-07:514" >> /etc/rsyslog.conf



#if the forloop does not work. Copy and paste these lines into all of the server.
