#!/bin/bash

git clone https://github.com/DaraUng/NTI-320

echo "creating reposrv"
#reposrv
gcloud compute instances create reposrv \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/repoclient.sh \
--private-network-ip=10.138.0.19

echo "creating buildsrv"
#reposrv
gcloud compute instances create buildsrv \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/buildsrv.sh

echo "creating nagios-install"
#nagios
gcloud compute instances create nagios-install \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/nagios-install.sh \
--private-network-ip=10.138.0.46

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

echo "creating rsyslog"
#rsyslog
gcloud compute instances create rsyslog \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/rsyslog.sh \
--private-network-ip=10.138.0.56

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

echo "creating nfs"
#NSF-a
gcloud compute instances create nfs \
--image-family centos-7 \
--image-project centos-cloud \
--zone us-west1-b \
--tags "http-server","https-server" \
--machine-type f1-micro \
--scopes cloud-platform \
--metadata-from-file startup-script=NTI-320/nfs.sh

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



