From: Vivi Kusumo <vivi_ksm@yahoo.com>
Subject: error on ax25-tools
Date: Wed, 21 Aug 2002 22:15:51 -0700 (PDT)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20020822051551.8119.qmail@web14406.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-hams@vger.kernel.org

Hi all,

I am new here and now installing the ax.25 protocol in
my machine:
RH 7.1 kernel 2.4.19
gcc version 2.96
glibc-2.2.2-10
no firewall
network configuration -> active on boot, static (no
DHCP)=20
server installed: news, nfs, samba,anonym ftp, dns=20

I have downloaded libax-0.0.7.tar.gz,
ax25-tools-0.0.6.tar.gz and ax25-apps-0.0.4.tar.gz
I finished to compile and install libax25 and now I
get an error message while trying to compile
ax25-tools.=20
..
..
Making install in ax25
make[1]: Entering directory
`/usr/src/ax25-tools-0.0.6/ax25'
gcc -DHAVE_CONFIG_H -I. -I. -I..
-DAX25_SYSCONFDIR=3D=A5""/etc/ax25/"=A5" =20
-DAX25_LOCALSTATEDIR=3D=A5""/var/ax25/"=A5" -g -O2 -Wall -c
bpqparms.c
In file included from bpqparms.c:28:
/usr/include/linux/timer.h:21: field `vec' has
incomplete type
/usr/include/linux/timer.h:22: confused by earlier
errors, bailing out
make[1]: *** [bpqparms.o] Error 1
make[1]: Leaving directory
`/usr/src/ax25-tools-0.0.6/ax25'
make: *** [install-recursive] Error 1=20

Does it mean have any connection with my machine's
spec?=20

Thanks for any help.
vivi

__________________________________________________
Do You Yahoo!?
HotJobs - Search Thousands of New Jobs
http://www.hotjobs.com
