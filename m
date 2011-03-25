From: David Ranch <linux-hams@trinnet.net>
Subject: Compiling TrustedQSL 1.13 issue
Date: Thu, 24 Mar 2011 17:07:33 -0700
Message-ID: <4D8BDCC5.4040406@trinnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hello Everyone,

I was able to compile TrustedQSL 1.11 on my Centos 5.5 machine based from 
the 1.11 sources at http://koji.fedoraproject.org/koji/packageinfo?packageID=72670
without any issues but I cannot get 1.13 to compile.  I get the following errors.  Could 
someone give me a hand figuring out what's wrong?


Ps.  I tried emailing the project admins listed on http://sourceforge.net/projects/trustedqsl/develop but both addresess bounced.

--David
KI6ZHD



Known dependencies and their versions
--
glibc-2.5-49.el5_5.7
cpp-4.1.2-48.el5
wxGTK-devel-2.8.10-1.el5.rf
zlib-devel-1.2.3-3
desktop-file-utils-0.10-7
expat-devel-1.95.8-8.3.el5_5.3
chromium-expat-devel-2.0.1-0.r1




[root@hampacket SPECS]# rpmbuild -bb --target=i686 trustedqsl.spec
Building target platforms: i686
Building for target i686
Executing(%prep): /bin/sh -e /var/tmp/rpm-tmp.69980
+ umask 022
+ cd /usr/src/redhat/BUILD
+ LANG=C
+ export LANG
+ unset DISPLAY
+ cd /usr/src/redhat/BUILD
+ rm -rf TrustedQSL-1.13
+ /bin/gzip -dc /usr/src/redhat/SOURCES/TrustedQSL-1.13.tar.gz
+ tar -xf -
+ STATUS=0
+ '[' 0 -ne 0 ']'
+ cd TrustedQSL-1.13
++ /usr/bin/id -u
+ '[' 0 = 0 ']'
+ /bin/chown -Rhf root .
++ /usr/bin/id -u
+ '[' 0 = 0 ']'
+ /bin/chgrp -Rhf root .
+ /bin/chmod -Rf a+rX,u+w,g-w,o-w .
+ echo 'Patch #1 (TrustedQSL-1.13-lib64.patch):'
Patch #1 (TrustedQSL-1.13-lib64.patch):
+ patch -p1 -b --suffix .lib64 -s
+ exit 0
Executing(%build): /bin/sh -e /var/tmp/rpm-tmp.69980
+ umask 022
+ cd /usr/src/redhat/BUILD
+ cd TrustedQSL-1.13
+ LANG=C
+ export LANG
+ unset DISPLAY
+ export OPENSSL=/usr
+ OPENSSL=/usr
+ export TQSLLIB=/usr
+ TQSLLIB=/usr
+ CFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables'
+ export CFLAGS
+ CXXFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables'
+ export CXXFLAGS
+ FFLAGS='-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables'
+ export FFLAGS
++ find . -name config.guess -o -name config.sub
+ for i in '$(find . -name config.guess -o -name config.sub)'
++ basename ./config.sub
+ '[' -f /usr/lib/rpm/redhat/config.sub ']'
+ /bin/rm -f ./config.sub
++ basename ./config.sub
+ /bin/cp -fv /usr/lib/rpm/redhat/config.sub ./config.sub
`/usr/lib/rpm/redhat/config.sub' -> `./config.sub'
+ for i in '$(find . -name config.guess -o -name config.sub)'
++ basename ./config.guess
+ '[' -f /usr/lib/rpm/redhat/config.guess ']'
+ /bin/rm -f ./config.guess
++ basename ./config.guess
+ /bin/cp -fv /usr/lib/rpm/redhat/config.guess ./config.guess
`/usr/lib/rpm/redhat/config.guess' -> `./config.guess'
+ ./configure --build=i686-redhat-linux-gnu --host=i686-redhat-linux-gnu --target=i686-redhat-linux-gnu --program-prefix= --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share --includedir=/usr/include --libdir=/usr/lib --libexecdir=/usr/libexec --localstatedir=/var --sharedstatedir=/usr/com --mandir=/usr/share/man --infodir=/usr/share/info --without-openssl --without-tqsllib
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking build system type... i686-redhat-linux-gnu
checking host system type... i686-redhat-linux-gnu
checking for i686-redhat-linux-gnu-gcc... no
checking for gcc... gcc
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... no
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
checking whether gcc accepts -g... yes
checking for gcc option to accept ISO C89... none needed
checking for style of include used by make... GNU
checking dependency style of gcc... gcc3
checking how to run the C preprocessor... gcc -E
checking for i686-redhat-linux-gnu-g++... no
checking for i686-redhat-linux-gnu-c++... no
checking for i686-redhat-linux-gnu-gpp... no
checking for i686-redhat-linux-gnu-aCC... no
checking for i686-redhat-linux-gnu-CC... no
checking for i686-redhat-linux-gnu-cxx... no
checking for i686-redhat-linux-gnu-cc++... no
checking for i686-redhat-linux-gnu-cl.exe... no
checking for i686-redhat-linux-gnu-FCC... no
checking for i686-redhat-linux-gnu-KCC... no
checking for i686-redhat-linux-gnu-RCC... no
checking for i686-redhat-linux-gnu-xlC_r... no
checking for i686-redhat-linux-gnu-xlC... no
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking for i686-redhat-linux-gnu-ranlib... no
checking for ranlib... ranlib
checking whether ln -s works... yes
checking for cp... /bin/cp
checking for perl... /usr/bin/perl
checking for touch... /bin/touch
checking for mkdir... /bin/mkdir
checking for strip... /usr/bin/strip
checking for sed... /bin/sed
checking for echo... /bin/echo
checking for tqsllib library... /usr
checking for tqsllib headers... /usr/include
checking for zlib library (libz.a)... /usr
checking for expat library (libexpat.a)... /usr
checking for wxWindows... /usr
checking for main in -lz... yes
checking for main in -lexpat... yes
checking for main in -ltqsllib... yes
checking for an ANSI C-conforming const... yes
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking for size_t... yes
checking for mkdir... yes
checking for strerror... yes
checking for a BSD-compatible install... /usr/bin/install -c
configure: creating ./config.status
config.status: creating Makefile
config.status: creating tqsl.rc
config.status: creating tqslcert.rc
config.status: creating setup.iss
config.status: creating TrustedQSL.spec
config.status: creating sysconfig.h
config.status: executing depfiles commands
+ make
/usr/bin/perl ./touchver.pl ./tqslbuild.h.in BUILD unofficial
/bin/cp ./tqslbuild.h.in tqslbuild.h
/bin/touch ./tqslbuild.h.in
/usr/bin/perl ./touchver.pl ./tqslcertbuild.h.in BUILD unofficial
/bin/cp ./tqslcertbuild.h.in tqslcertbuild.h
/bin/touch ./tqslcertbuild.h.in
test -e help || ln -s ./help help
test -e icons || ln -s ./icons icons
cd . && /bin/sh /usr/src/redhat/BUILD/TrustedQSL-1.13/missing --run autoheader
aclocal.m4:17: error: this file was generated for autoconf 2.61.
You have another version of autoconf.  If you want to use that,
you should regenerate the build system entirely.
aclocal.m4:17: the top level
autom4te: /usr/bin/m4 failed with exit status: 63
autoheader: /usr/bin/autom4te failed with exit status: 63
WARNING: `autoheader' is probably too old.  You should only need it if
         you modified `acconfig.h' or `configure.in'.  You might want
         to install the `Autoconf' and `GNU m4' packages.  Grab them
         from any GNU archive site.
rm -f stamp-h1
touch sysconfig.h.in
make  all-am
make[1]: Entering directory `/usr/src/redhat/BUILD/TrustedQSL-1.13'
g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags` -I/usr/include -I/usr/include -I/usr/include -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables -MT tqsl.o -MD -MP -MF .deps/tqsl.Tpo -c -o tqsl.o tqsl.cpp
/usr/include/wx-2.8/wx/hashmap.h: In member function 'wxLongToLongHashMap_wxImplementation_HashTable::Node** wxLongToLongHashMap_wxImplementation_HashTable::GetNodePtr(const long int&) const':
/usr/include/wx-2.8/wx/hashmap.h:735: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectMethods_wxImplementation_HashTable::Node** wxShadowObjectMethods_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:20: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectFields_wxImplementation_HashTable::Node** wxShadowObjectFields_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:25: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/gdicmn.h: In member function 'wxStringToColourHashMap_wxImplementation_HashTable::Node** wxStringToColourHashMap_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/gdicmn.h:544: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/image.h: In member function 'wxImageHistogramBase_wxImplementation_HashTable::Node** wxImageHistogramBase_wxImplementation_HashTable::GetNodePtr(const long unsigned int&) const':
/usr/include/wx-2.8/wx/image.h:136: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/filesys.h: In member function 'wxFSHandlerHash_wxImplementation_HashTable::Node** wxFSHandlerHash_wxImplementation_HashTable::GetNodePtr(const void* const&) const':
/usr/include/wx-2.8/wx/filesys.h:176: warning: dereferencing type-punned pointer will break strict-aliasing rules
mv -f .deps/tqsl.Tpo .deps/tqsl.Po
g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags` -I/usr/include -I/usr/include -I/usr/include -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables -MT extwizard.o -MD -MP -MF .deps/extwizard.Tpo -c -o extwizard.o extwizard.cpp
/usr/include/wx-2.8/wx/hashmap.h: In member function 'wxLongToLongHashMap_wxImplementation_HashTable::Node** wxLongToLongHashMap_wxImplementation_HashTable::GetNodePtr(const long int&) const':
/usr/include/wx-2.8/wx/hashmap.h:735: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectMethods_wxImplementation_HashTable::Node** wxShadowObjectMethods_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:20: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectFields_wxImplementation_HashTable::Node** wxShadowObjectFields_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:25: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/gdicmn.h: In member function 'wxStringToColourHashMap_wxImplementation_HashTable::Node** wxStringToColourHashMap_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/gdicmn.h:544: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/image.h: In member function 'wxImageHistogramBase_wxImplementation_HashTable::Node** wxImageHistogramBase_wxImplementation_HashTable::GetNodePtr(const long unsigned int&) const':
/usr/include/wx-2.8/wx/image.h:136: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/filesys.h: In member function 'wxFSHandlerHash_wxImplementation_HashTable::Node** wxFSHandlerHash_wxImplementation_HashTable::GetNodePtr(const void* const&) const':
/usr/include/wx-2.8/wx/filesys.h:176: warning: dereferencing type-punned pointer will break strict-aliasing rules
mv -f .deps/extwizard.Tpo .deps/extwizard.Po
g++ -DHAVE_CONFIG_H -I.    -Wall `"/usr/bin/wx-config" --cxxflags` -I/usr/include -I/usr/include -I/usr/include -O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m32 -march=i686 -mtune=generic -fasynchronous-unwind-tables -MT tqslwiz.o -MD -MP -MF .deps/tqslwiz.Tpo -c -o tqslwiz.o tqslwiz.cpp
/usr/include/wx-2.8/wx/hashmap.h: In member function 'wxLongToLongHashMap_wxImplementation_HashTable::Node** wxLongToLongHashMap_wxImplementation_HashTable::GetNodePtr(const long int&) const':
/usr/include/wx-2.8/wx/hashmap.h:735: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectMethods_wxImplementation_HashTable::Node** wxShadowObjectMethods_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:20: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/clntdata.h: In member function 'wxShadowObjectFields_wxImplementation_HashTable::Node** wxShadowObjectFields_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/clntdata.h:25: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/gdicmn.h: In member function 'wxStringToColourHashMap_wxImplementation_HashTable::Node** wxStringToColourHashMap_wxImplementation_HashTable::GetNodePtr(const wxString&) const':
/usr/include/wx-2.8/wx/gdicmn.h:544: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/image.h: In member function 'wxImageHistogramBase_wxImplementation_HashTable::Node** wxImageHistogramBase_wxImplementation_HashTable::GetNodePtr(const long unsigned int&) const':
/usr/include/wx-2.8/wx/image.h:136: warning: dereferencing type-punned pointer will break strict-aliasing rules
/usr/include/wx-2.8/wx/filesys.h: In member function 'wxFSHandlerHash_wxImplementation_HashTable::Node** wxFSHandlerHash_wxImplementation_HashTable::GetNodePtr(const void* const&) const':
/usr/include/wx-2.8/wx/filesys.h:176: warning: dereferencing type-punned pointer will break strict-aliasing rules
tqslwiz.cpp: In member function 'void TQSLWizCertPage::UpdateFields(int)':
tqslwiz.cpp:118: error: 'tqsl_getLocationFieldFlags' was not declared in this scope
tqslwiz.cpp: In constructor 'TQSLWizCertPage::TQSLWizCertPage(TQSLWizard*, void*)':
tqslwiz.cpp:258: error: 'tqsl_getLocationFieldFlags' was not declared in this scope
make[1]: *** [tqslwiz.o] Error 1
make[1]: Leaving directory `/usr/src/redhat/BUILD/TrustedQSL-1.13'

