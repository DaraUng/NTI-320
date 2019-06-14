cd /root/rpmbuild/SOURCES
 git clone https://github.com/nic-instruction/custom-nrpe-2019.git
 cp custom-nrpe-2019/nti-320-plugins.spec .
 cp custom-nrpe-2019/nti-320-plugins-0.1.tar.gz .
 cp nti-320-plugins.spec ../SPECS
 cd ../
 rpmbuild -v -bb --clean SPECS/nti-320-plugins.spec
 cp RPMS/x86_64/nti-320-plugins-0.1-1.el7.x86_64.rpm 
 cp RPMS/x86_64/nti-320-plugins-0.1-1.el7.x86_64.rpm /home/dara_ung
 
 gcloud compute scp dara_ung@buildsrv:/home/dara_ung/nti-320-plugins-0.1-1.el7.x86_64.rpm .
 gcloud compute scp nti-320-plugins-0.1-1.el7.x86_64.rpm dara_ung@reposrv:/home/dara_ung/nti-320-plugins-0.1-1.el7.x86_64.rpm 
 
cp nti-320-plugins-0.1-1.el7.x86_64.rpm /repos/centos/7/extras/x86_64/Packages/
