#!/bin/bash

git clone https://github.com/DaraUng/NTI-320

echo "creating cacti"
#cacti
gcloud compute instances create cacti-install \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/cacti-install.sh

echo "creating nagios-install"
#nagios
gcloud compute instances create nagios-install \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/nagios-install.sh

echo "creating nrpe.sh"
#nrpe
gcloud compute instances create nrpe \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/nrpe.sh

echo "creating postgres"
#postgres.sh
gcloud compute instances create postgres \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/postgres.sh

echo "creating ldap-server"
#LDAP-server
gcloud compute instances create ldap-server \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/ldap-server.sh

echo "creating nfs-a"
#NSF-a
gcloud compute instances create nfs \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/nfs_a.sh

echo "creating django"
#Django
gcloud compute instances create django \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/django.sh

echo "creating rsyslog"
#rsyslog
gcloud compute instances create rsyslog \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/rsyslog.sh


echo "creating client-c"
#LDAP
gcloud compute instances create client-c \
--image-family ubuntu-1804-lts \
--image-project ubuntu-os-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/LDAP\ Client\ Automation      
