From: Peter Barrett <vk6fun@gmail.com>
Subject: ax25-tools-0.0.10rc2 compile errors
Date: Sat, 4 Dec 2010 11:49:08 +0800
Message-ID: <AANLkTi=7=b414E6e-x_CW8qW68ArUwNOpJZD_uD84yk-@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=bJwuq5qk3ihSNyZb15Lx/jo2iMsfnQf4Mz39jbBqFq0=;
        b=jdmhFOeS1comjkKtB4WglNvntJeRMtfpEaxe8SSTlRpgVxNB2ODFz0qAJY3TYHkg+n
         q41TH3rUU38eX16vDhVKlSJx0juqtdXoiyEMeEv7ZYaG4B/y8lrZK3FggQ0z2tpvUcfp
         L0PYEouY00JoQRp7CCVq4baKi5qkH4fXfiqho=
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

# ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
checking for a BSD-compatible install... /usr/bin/ginstall -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... ./install-sh -c -d
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for gawk... (cached) gawk
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
checking for g++... g++
checking whether we are using the GNU C++ compiler... yes
checking whether g++ accepts -g... yes
checking dependency style of g++... gcc3
checking for a BSD-compatible install... /usr/bin/ginstall -c
checking how to run the C preprocessor... gcc -E
checking for X... libraries /usr/X11R7/lib, headers /usr/X11R7/include
checking whether -R must be followed by a space... neither works
checking for gethostbyname... yes
checking for connect... yes
checking for remove... yes
checking for shmat... yes
checking for IceConnectionNumber in -lICE... yes
checking for zlibVersion in -lz... yes
checking for ax25_config_load_ports in -lax25... yes
checking for initscr in -lncurses... yes
checking for openpty in -lutil... yes
checking for main in -lGL... yes
checking for main in -lfltk... yes
checking for grep that handles long lines and -e... /bin/grep
checking for egrep... /bin/grep -E
checking for ANSI C header files... yes
checking for sys/wait.h that is POSIX.1 compatible... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking fcntl.h usability... yes
checking fcntl.h presence... yes
checking for fcntl.h... yes
checking limits.h usability... yes
checking limits.h presence... yes
checking for limits.h... yes
checking paths.h usability... yes
checking paths.h presence... yes
checking for paths.h... yes
checking for strings.h... (cached) yes
checking sys/file.h usability... yes
checking sys/file.h presence... yes
checking for sys/file.h... yes
checking sys/ioctl.h usability... yes
checking sys/ioctl.h presence... yes
checking for sys/ioctl.h... yes
checking sys/time.h usability... yes
checking sys/time.h presence... yes
checking for sys/time.h... yes
checking syslog.h usability... yes
checking syslog.h presence... yes
checking for syslog.h... yes
checking for unistd.h... (cached) yes
checking zlib.h usability... yes
checking zlib.h presence... yes
checking for zlib.h... yes
checking for struct ax25_fwd_struct... yes
checking for struct nr_route_struct.ndigis... yes
checking for struct rose_facilities_struct... yes
checking for an ANSI C-conforming const... yes
checking for uid_t in sys/types.h... yes
checking for pid_t... yes
checking whether time.h and sys/time.h may both be included... yes
checking whether struct tm is in sys/time.h or time.h... time.h
checking whether gcc needs -traditional... no
checking for working memcmp... yes
checking whether setpgrp takes no argument... yes
checking return type of signal handlers... void
checking for strftime... yes
checking for wait3 that fills in rusage... yes
checking for gethostname... yes
checking for gettimeofday... yes
checking for mkdir... yes
checking for select... yes
checking for socket... yes
checking for strdup... yes
checking for strerror... yes
checking for strspn... yes
checking for strstr... yes
checking for strtol... yes
checking for strtoul... yes
checking for uname... yes
configure: creating ./config.status
config.status: creating netrom/Makefile
config.status: creating tcpip/Makefile
config.status: creating ax25/Makefile
config.status: creating ax25/axgetput/Makefile
config.status: creating Makefile
config.status: creating rose/Makefile
config.status: creating user_call/Makefile
config.status: creating kiss/Makefile
config.status: creating 6pack/Makefile
config.status: creating hdlcutil/Makefile
config.status: creating hdlcutil/fl/Makefile
config.status: creating yamdrv/Makefile
config.status: creating dmascc/Makefile
config.status: creating config.h
config.status: executing depfiles commands
# make
make  all-recursive
make[1]: Entering directory `/root/src/ax25-tools-0.0.10-rc2'
Making all in ax25
make[2]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/ax25'
Making all in axgetput
make[3]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/ax25/axgetput'
gcc -DHAVE_CONFIG_H -I. -I../..     -g -O2 -Wall -MT axgetput.o -MD
-MP -MF .deps/axgetput.Tpo -c -o axgetput.o axgetput.c
mv -f .deps/axgetput.Tpo .deps/axgetput.Po
gcc -DHAVE_CONFIG_H -I. -I../..     -g -O2 -Wall -MT util.o -MD -MP
-MF .deps/util.Tpo -c -o util.o util.c
mv -f .deps/util.Tpo .deps/util.Po
gcc -DHAVE_CONFIG_H -I. -I../..     -g -O2 -Wall -MT proto_bin.o -MD
-MP -MF .deps/proto_bin.Tpo -c -o proto_bin.o proto_bin.c
mv -f .deps/proto_bin.Tpo .deps/proto_bin.Po
gcc  -g -O2 -Wall   -o axgetput axgetput.o util.o proto_bin.o
make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/ax25/axgetput'
make[3]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/ax25'
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT mheard.o
-MD -MP -MF .deps/mheard.Tpo -c -o mheard.o mheard.c
mv -f .deps/mheard.Tpo .deps/mheard.Po
gcc  -g -O2 -Wall   -o mheard mheard.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT ax25d.o -MD
-MP -MF .deps/ax25d.Tpo -c -o ax25d.o ax25d.c
mv -f .deps/ax25d.Tpo .deps/ax25d.Po
gcc  -g -O2 -Wall   -o ax25d ax25d.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT axctl.o -MD
-MP -MF .deps/axctl.Tpo -c -o axctl.o axctl.c
mv -f .deps/axctl.Tpo .deps/axctl.Po
gcc  -g -O2 -Wall   -o axctl axctl.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT axparms.o
-MD -MP -MF .deps/axparms.Tpo -c -o axparms.o axparms.c
mv -f .deps/axparms.Tpo .deps/axparms.Po
gcc  -g -O2 -Wall   -o axparms axparms.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT axspawn.o
-MD -MP -MF .deps/axspawn.Tpo -c -o axspawn.o axspawn.c
axspawn.c: In function 'decstathuf':
axspawn.c:596: warning: pointer targets in assignment differ in signedness
axspawn.c:597: warning: pointer targets in assignment differ in signedness
axspawn.c: In function 'read_ax25':
axspawn.c:676: warning: pointer targets in passing argument 1 of
'decstathuf' differ in signedness
axspawn.c:678: warning: pointer targets in passing argument 1 of
'strcpy' differ in signedness
axspawn.c:691: warning: pointer targets in passing argument 1 of
'Strncasecmp' differ in signedness
axspawn.c:705: warning: pointer targets in passing argument 1 of
'strcpy' differ in signedness
axspawn.c:709: warning: pointer targets in passing argument 1 of
'Strncasecmp' differ in signedness
axspawn.c:728: warning: pointer targets in passing argument 1 of
'strcpy' differ in signedness
axspawn.c: In function 'new_user':
axspawn.c:1087: warning: pointer targets in assignment differ in signedness
axspawn.c:1131: warning: pointer targets in assignment differ in signedness
axspawn.c: In function 'main':
axspawn.c:1498: warning: pointer targets in passing argument 1 of
'read_ax25' differ in signedness
axspawn.c:1512: warning: pointer targets in passing argument 1 of
'read_ax25' differ in signedness
axspawn.c:1591: warning: pointer targets in passing argument 1 of
'read_ax25' differ in signedness
axspawn.c:1862: warning: pointer targets in passing argument 1 of
'read_ax25' differ in signedness
mv -f .deps/axspawn.Tpo .deps/axspawn.Po
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT access.o
-MD -MP -MF .deps/access.Tpo -c -o access.o access.c
access.c: In function 'calc_md5_pw':
access.c:194: warning: pointer targets in passing argument 2 of
'MD5Update' differ in signedness
mv -f .deps/access.Tpo .deps/access.Po
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT md5.o -MD
-MP -MF .deps/md5.Tpo -c -o md5.o md5.c
mv -f .deps/md5.Tpo .deps/md5.Po
gcc  -g -O2 -Wall   -o axspawn axspawn.o access.o md5.o -lax25 -lutil
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT beacon.o
-MD -MP -MF .deps/beacon.Tpo -c -o beacon.o beacon.c
mv -f .deps/beacon.Tpo .deps/beacon.Po
gcc  -g -O2 -Wall   -o beacon beacon.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT bpqparms.o
-MD -MP -MF .deps/bpqparms.Tpo -c -o bpqparms.o bpqparms.c
mv -f .deps/bpqparms.Tpo .deps/bpqparms.Po
gcc  -g -O2 -Wall   -o bpqparms bpqparms.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT mheardd.o
-MD -MP -MF .deps/mheardd.Tpo -c -o mheardd.o mheardd.c
mheardd.c: In function 'main':
mheardd.c:259: warning: pointer targets in passing argument 1 of
'ax25_validate' differ in signedness
mheardd.c:259: warning: pointer targets in passing argument 1 of
'ax25_validate' differ in signedness
mv -f .deps/mheardd.Tpo .deps/mheardd.Po
gcc  -g -O2 -Wall   -o mheardd mheardd.o -lax25
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT rxecho.o
-MD -MP -MF .deps/rxecho.Tpo -c -o rxecho.o rxecho.c
mv -f .deps/rxecho.Tpo .deps/rxecho.Po
gcc  -g -O2 -Wall   -o rxecho rxecho.o -lax25
make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/ax25'
make[2]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/ax25'
Making all in hdlcutil
make[2]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
Making all in .
make[3]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT sethdlc.o
-MD -MP -MF .deps/sethdlc.Tpo -c -o sethdlc.o sethdlc.c
sethdlc.c: In function 'main':
sethdlc.c:539: warning: pointer targets in passing argument 1 of
'hdrvc_recvpacket' differ in signedness
mv -f .deps/sethdlc.Tpo .deps/sethdlc.Po
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT hdrvcomm.o
-MD -MP -MF .deps/hdrvcomm.Tpo -c -o hdrvcomm.o hdrvcomm.c
hdrvcomm.c: In function 'hdrvc_get_driver_name':
hdrvcomm.c:677: warning: pointer targets in passing argument 2 of
'__builtin_strncpy' differ in signedness
hdrvcomm.c: In function 'hdrvc_get_mode_name':
hdrvcomm.c:712: warning: pointer targets in passing argument 2 of
'__builtin_strncpy' differ in signedness
mv -f .deps/hdrvcomm.Tpo .deps/hdrvcomm.Po
gcc  -g -O2 -Wall   -o sethdlc sethdlc.o hdrvcomm.o
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT smmixer.o
-MD -MP -MF .deps/smmixer.Tpo -c -o smmixer.o smmixer.c
mv -f .deps/smmixer.Tpo .deps/smmixer.Po
gcc  -g -O2 -Wall   -o smmixer smmixer.o hdrvcomm.o
gcc -DHAVE_CONFIG_H -I. -I.. -DAX25_SYSCONFDIR=\""/etc/ax25/"\"
-DAX25_LOCALSTATEDIR=\""/var/ax25/"\"     -g -O2 -Wall -MT smdiag.o
-MD -MP -MF .deps/smdiag.Tpo -c -o smdiag.o smdiag.c
mv -f .deps/smdiag.Tpo .deps/smdiag.Po
gcc  -g -O2 -Wall   -o smdiag smdiag.o hdrvcomm.o -L/usr/X11R7/lib -lX11
make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
Making all in fl
make[3]: Entering directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl'
g++ -DHAVE_CONFIG_H -I. -I../..  -I/usr/X11R7/include -I./..   -g -O2
-MT xfsmmixer.o -MD -MP -MF .deps/xfsmmixer.Tpo -c -o xfsmmixer.o
xfsmmixer.cxx
mv -f .deps/xfsmmixer.Tpo .deps/xfsmmixer.Po
g++ -DHAVE_CONFIG_H -I. -I../..  -I/usr/X11R7/include -I./..   -g -O2
-MT xfsmmixer_main.o -MD -MP -MF .deps/xfsmmixer_main.Tpo -c -o
xfsmmixer_main.o xfsmmixer_main.cxx
xfsmmixer_main.cxx: In function 'int main(int, char**)':
xfsmmixer_main.cxx:318: warning: deprecated conversion from string
constant to 'char*'
mv -f .deps/xfsmmixer_main.Tpo .deps/xfsmmixer_main.Po
g++  -g -O2 -L/usr/X11R7/lib -lX11 -lfltk -lGL  -lSM -lICE -lXi -lXext
-lX11  ../hdrvcomm.o  -o xfsmmixer xfsmmixer.o xfsmmixer_main.o
xfsmmixer.o: In function `create_form_ct1745()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:300:
undefined reference to `Fl_Window::Fl_Window(int, int, char const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1745()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:309:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:314:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:319:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:324:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:329:
undefined reference to `Fl_Button::Fl_Button(int, int, int, int, char
const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:332:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:337:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:342:
undefined reference to `Fl_Group::Fl_Group(int, int, int, int, char
const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1745()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:351:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:352:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:356:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:357:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:361:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:362:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:366:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:367:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:371:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:372:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:376:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:377:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:381:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:382:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:386:
undefined reference to `Fl_Group::end()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:388:
undefined reference to `Fl_Group::Fl_Group(int, int, int, int, char
const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1745()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:397:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:398:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:402:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:403:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:407:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:408:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:412:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:413:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:417:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:418:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:422:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:423:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:427:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:428:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:432:
undefined reference to `Fl_Group::end()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:434:
undefined reference to `Fl_Group::end()'
xfsmmixer.o: In function `create_form_ct1345()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:194:
undefined reference to `Fl_Window::Fl_Window(int, int, char const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1345()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:203:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:208:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:213:
undefined reference to `Fl_Button::Fl_Button(int, int, int, int, char
const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:216:
undefined reference to `Fl_Group::Fl_Group(int, int, int, int, char
const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1345()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:221:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:223:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:227:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:229:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:233:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:235:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1345()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:243:
undefined reference to `Fl_Group::end()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:245:
undefined reference to `Fl_Group::end()'
xfsmmixer.o: In function `create_form_ct1335()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:154:
undefined reference to `Fl_Window::Fl_Window(int, int, char const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ct1335()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:163:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:168:
undefined reference to `Fl_Button::Fl_Button(int, int, int, int, char
const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:171:
undefined reference to `Fl_Group::end()'
xfsmmixer.o: In function `create_form_ad1848()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:39:
undefined reference to `Fl_Window::Fl_Window(int, int, char const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ad1848()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:48:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:53:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:58:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:63:
undefined reference to `Fl_Value_Slider::Fl_Value_Slider(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:68:
undefined reference to `Fl_Button::Fl_Button(int, int, int, int, char
const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:71:
undefined reference to `Fl_Group::Fl_Group(int, int, int, int, char
const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ad1848()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:76:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:78:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:82:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:84:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:88:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:90:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:94:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:96:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ad1848()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:104:
undefined reference to `Fl_Group::end()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:106:
undefined reference to `Fl_Group::Fl_Group(int, int, int, int, char
const*)'
xfsmmixer.o: In function `Fl_Box':
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to
`Fl_Widget::Fl_Widget(int, int, int, int, char const*)'
/usr/local/include/FL/Fl_Box.H:40: undefined reference to `vtable for Fl_Box'
xfsmmixer.o: In function `create_form_ad1848()':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:115:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:117:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:121:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:123:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:127:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:129:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:133:
undefined reference to `Fl_Check_Button::Fl_Check_Button(int, int,
int, int, char const*)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:135:
undefined reference to `fl_define_FL_DIAMOND_BOX()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:139:
undefined reference to `Fl_Group::end()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer.cxx:141:
undefined reference to `Fl_Group::end()'
xfsmmixer_main.o: In function `main':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:321:
undefined reference to `Fl::arg(int, char**, int&)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:416:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:418:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:420:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:422:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:424:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:426:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:428:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:430:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:432:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:433:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:434:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:435:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:436:
undefined reference to `Fl_Button::value(int)'
xfsmmixer_main.o:/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:437:
more undefined references to `Fl_Button::value(int)' follow
xfsmmixer_main.o: In function `main':
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:448:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:449:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:451:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:452:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:460:
undefined reference to `Fl::run()'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:399:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:400:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:401:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:402:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:403:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:404:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:406:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:407:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:408:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:389:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:390:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:391:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:359:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:360:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:361:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:362:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:363:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:364:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:365:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:367:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:368:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:369:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:370:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:371:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:372:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:373:
undefined reference to `Fl_Button::value(int)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:375:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:376:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:377:
undefined reference to `Fl_Valuator::value(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:379:
undefined reference to `Fl_Valuator::step(double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:380:
undefined reference to `Fl_Slider::bounds(double, double)'
/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl/xfsmmixer_main.cxx:381:
undefined reference to `Fl_Valuator::value(double)'
collect2: ld returned 1 exit status
make[3]: *** [xfsmmixer] Error 1
make[3]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil/fl'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2/hdlcutil'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/root/src/ax25-tools-0.0.10-rc2'
make: *** [all] Error 2
