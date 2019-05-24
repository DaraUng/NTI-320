Name:		helloworld
Version: 	0.1
Release:	1%{?dist}
Summary: 	A program that prints 'Hello World'

Group:		NTI-320	
License:	GPL2+
URL:		https://github.com/nic-instruction/NTI-320
Source0:	https://github.com/nic-instruction/NTI-320/blob/master/rpm-info/helloworld-0.1.tar.gz

BuildRequires:	gcc, python >= 1.3
Requires:	bash

%description
'hello' will print 'hello cruel world' at each of your users when they log in.

install 'hello' if you would like a program to print 'hello cruel world' to you and 
other users of your system upon login.

%prep					
			

%setup -q	
		
%build					
%configure			
make %{?_smp_mflags}	
cp /root/rpmbuild/SOURCES/helloworld.sh /root/rpmbuild/BUILD/helloworld-0.1/


mo
%install
rm -rf %{buildroot}
mkdir -p %{buildroot}/%{_bindir}
mkdir -p %{buildroot}/%{_sysconfdir}/profile.d

#motify eerything to 0755

make install DESTDIR=%{buildroot}
install -m 0755 %{name} %{buildroot}/%{_bindir}/%{name}
cp /root/rpmbuild/SOURCES/helloworld.sh %{buildroot}/%{_sysconfdir}/profile.d/
%clean

#name of rpm
%files					
%defattr(-,root,root)	
/usr/bin/%{name}

%config
/etc/profile.d/%{name}.sh	

#any doc will be posting here
%doc			

%post

#this will show the line that said this worked if the program is running without any error
touch /thisworked

#this will remove the post after
%postun
rm /thisworked

%changelog	
