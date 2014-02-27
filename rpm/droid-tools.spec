Name:		droid-tools
Version:	0.0.1
Release:	1%{?dist}
Summary:	Some tools from android

Group:		Tools
License:	Apache2, BSD, or MIT
URL:		https://android.googlesource.com/
Source0:	%{name}-%{version}.tar.bz2

%description
%{summary}

%prep
%setup -q

%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
%make_install

%files
%defattr(-,root,root,-)
%{_bindir}/mkbootimg
%{_bindir}/img2simg
%{_bindir}/simg2img
%{_bindir}/make_ext4fs

