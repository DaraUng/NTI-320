#!/bin/bash

yum -y install rpm-build make gcc git                                         # install rpm tools, compiling tools and source tools
mkdir -p /root/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}                      # GCC - a compiler system produced by the GNU Project supporting various programming languages
                                                                              # create the rpmbuild dirrectory structure
                                                                              # - P  mean the dirrectories parents.
                                                                              # (the docs say this happens by default, this is incorrect on centos 7)
cd ~/
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros                         # Set the rpmbuild path in an .rpmmacros file
cd ~/rpmbuild/SOURCES                                                             

