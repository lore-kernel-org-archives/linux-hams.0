From: "Jose Ng Lee" <jng@psi.net.pa>
Subject: ax25-tools-0.0.8src.tgz
Date: Sat, 6 May 2006 18:16:40 -0500
Message-ID: <001701c67163$21a76f80$ce6ee0c9@j1dxhp>
References: <20060506223800.GA4419@linux-mips.org>
Reply-To: "Jose Ng Lee" <jng@psi.net.pa>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=original"
To: linux-hams@vger.kernel.org

Hi,

I compiled OK a new kernel 2.6.16.14 with AX25 for my FEDORA CORE 4 and
downloaded from FTP site ftp://f6bvp.org/pub

ax25-apps-0.0.6src.tgz
ax25-tools-0.0.8src.tgz
libax25-0.0.11src.tgz

I make and installed OK ax25-apps-0.0.6src.tgz and libax25-0.0.11src.tg=
z.

But with ax25-tools-0.0.8src.tgz have the following ERROR on make below=
 at
the end of the e-mail.

When I unpacked ax25-tools-0.0.8src.tgz, I see inside in the directory
ax25-tools-0.008-2.6.tgz file.  I tried tar xvfz ax25-tools-0.008-2.6.t=
gz
and see nothing.  What is that file?  Is that a patch and how do I appl=
y it?

If somebody can help me. Thanks.

73s JOSE / HP2AT

[root@fedora ax25-tools-0.0.8]# make
make  all-recursive
make[1]: Entering directory `/home/hp2at/linux/ax25-tools-0.0.8'
Making all in ax25
make[2]: Entering directory `/home/hp2at/linux/ax25-tools-0.0.8/ax25'
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
mheard.c
gcc  -g -O2 -Wall  -o mheard  mheard.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
ax25d.c
gcc  -g -O2 -Wall  -o ax25d  ax25d.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
axctl.c
gcc  -g -O2 -Wall  -o axctl  axctl.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
axparms.c
gcc  -g -O2 -Wall  -o axparms  axparms.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
axspawn.c
gcc  -g -O2 -Wall  -o axspawn  axspawn.o -lax25 -lutil
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
beacon.c
gcc  -g -O2 -Wall  -o beacon  beacon.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
bpqparms.c
gcc  -g -O2 -Wall  -o bpqparms  bpqparms.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
mheardd.c
mheardd.c: In function =E2main=E2:
mheardd.c:272: warning: pointer targets in passing argument 1 of =E2fty=
pe=E2
differ in signedness
mheardd.c:333: warning: case label value exceeds maximum value for type
mheardd.c:339: warning: case label value exceeds maximum value for type
mheardd.c:342: warning: case label value exceeds maximum value for type
mheardd.c:345: warning: case label value exceeds maximum value for type
mheardd.c:351: warning: case label value exceeds maximum value for type
mheardd.c:354: warning: case label value exceeds maximum value for type
mheardd.c:357: warning: case label value exceeds maximum value for type
mheardd.c:360: warning: case label value exceeds maximum value for type
gcc  -g -O2 -Wall  -o mheardd  mheardd.o -lax25
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
rxecho.c
gcc  -g -O2 -Wall  -o rxecho  rxecho.o -lax25
make[2]: Leaving directory `/home/hp2at/linux/ax25-tools-0.0.8/ax25'
Making all in hdlcutil
make[2]: Entering directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcuti=
l'
Making all in fl
make[3]: Entering directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcuti=
l/fl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcutil=
/fl'
make[3]: Entering directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcuti=
l'
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
sethdlc.c
sethdlc.c: In function =E2main=E2:
sethdlc.c:540: warning: pointer targets in passing argument 1 of
=E2display_packet=E2 differ in signedness
gcc -DHAVE_CONFIG_H -I. -I. -I.. -DAX25_SYSCONFDIR=3D\""/usr/local/etc/=
ax25/"\"
     -DAX25_LOCALSTATEDIR=3D\""/usr/local/var/ax25/"\"     -g -O2 -Wall=
 -c
hdrvcomm.c
In file included from hdrvcomm.c:43:
/usr/include/asm/byteorder.h:6:2: warning: #warning using private kerne=
l
header; include <endian.h> instead!
In file included from hdrvcomm.c:57:
/usr/include/netinet/in.h:354: error: syntax error before =E2(=E2 token
/usr/include/netinet/in.h:354: error: syntax error before =E2__u32=E2
/usr/include/netinet/in.h:355: error: syntax error before =E2(=E2 token
/usr/include/netinet/in.h:355: error: syntax error before =E2__u16=E2
/usr/include/netinet/in.h:357: error: syntax error before =E2(=E2 token
/usr/include/netinet/in.h:357: error: syntax error before =E2__u32=E2
/usr/include/netinet/in.h:359: error: syntax error before =E2(=E2 token
/usr/include/netinet/in.h:359: error: syntax error before =E2__u16=E2
hdrvcomm.c: In function =E2hdrvc_get_driver_name=E2:
hdrvcomm.c:678: warning: pointer targets in passing argument 2 of
=E2__builtin_strncpy=E2 differ in signedness
hdrvcomm.c: In function =E2hdrvc_get_mode_name=E2:
hdrvcomm.c:713: warning: pointer targets in passing argument 2 of
=E2__builtin_strncpy=E2 differ in signedness
make[3]: *** [hdrvcomm.o] Error 1
make[3]: Leaving directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcutil=
'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/home/hp2at/linux/ax25-tools-0.0.8/hdlcutil=
'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/home/hp2at/linux/ax25-tools-0.0.8'
make: *** [all-recursive-am] Error 2
[root@fedora ax25-tools-0.0.8]#

-
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
