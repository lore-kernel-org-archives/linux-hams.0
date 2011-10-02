From: Miroslav Skoric <skoric@eunet.rs>
Subject: Compiling FBB
Date: Sun, 02 Oct 2011 17:41:02 +0200
Message-ID: <4E88860E.3030908@eunet.rs>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Linux Hams <linux-hams@vger.kernel.org>

Hi all!

I have been trying to compile fbbsrc.705c9 in Ubuntu 10.04.2 LTS. Both=20
daemon and X11 compile fails, as follows:

misko@client:/usr/local/src/ax25/fbbsrc.705c9/src$ sudo make
gcc -Wall -O2 -Wstrict-prototypes -funsigned-char  -D__LINUX__=20
-DPROTOTYPES -I../include -fstack-check   -c -o arbre.o arbre.c
In file included from ../include/serv.h:97,
                  from arbre.c:32:
=2E./include/fbb_serv.h:47:26: error: netax25/ax25.h: No such file or=20
directory
In file included from ../include/fbb_serv.h:48,
                  from ../include/serv.h:97,
                  from arbre.c:32:
/usr/include/netrom/netrom.h:44: error: expected=20
specifier-qualifier-list before =91ax25_address=92
In file included from ../include/fbb_serv.h:49,
                  from ../include/serv.h:97,
                  from arbre.c:32:
/usr/include/netrose/rose.h:74: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:83: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:92: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:107: error: expected=20
specifier-qualifier-list before =91ax25_address=92
=2E./include/fbb_serv.h:50:27: error: netax25/axlib.h: No such file or=20
directory
make: *** [arbre.o] Error 1
misko@client:/usr/local/src/ax25/fbbsrc.705c9/src$

=2E.. and for X11 ...

misko@client:/usr/local/src/ax25/fbbsrc.705c9/src/X11$ sudo make
gcc -Wall -Wstrict-prototypes -O2 -g -funsigned-char  -D__LINUX__=20
-DPROTOTYPES -I../../include -I/usr/X11R6/LessTif/Motif2.0/include=20
-I/usr/X11R6/include  -I/usr/local/include/netax25   -c -o xfbbabtd.o=20
xfbbabtd.c
In file included from ../../include/serv.h:97,
                  from xfbbabtd.c:27:
=2E./../include/fbb_serv.h:47:26: error: netax25/ax25.h: No such file o=
r=20
directory
In file included from ../../include/fbb_serv.h:48,
                  from ../../include/serv.h:97,
                  from xfbbabtd.c:27:
/usr/include/netrom/netrom.h:44: error: expected=20
specifier-qualifier-list before =91ax25_address=92
In file included from ../../include/fbb_serv.h:49,
                  from ../../include/serv.h:97,
                  from xfbbabtd.c:27:
/usr/include/netrose/rose.h:74: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:83: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:92: error: expected specifier-qualifier-lis=
t=20
before =91ax25_address=92
/usr/include/netrose/rose.h:107: error: expected=20
specifier-qualifier-list before =91ax25_address=92
=2E./../include/fbb_serv.h:50:27: error: netax25/axlib.h: No such file =
or=20
directory
make: *** [xfbbabtd.o] Error 1
misko@client:/usr/local/src/ax25/fbbsrc.705c9/src/X11$

Any suggestion to check for something that might be missing? Btw, I=20
noticed that related Makefile files have both AX25INCPATH =3D=20
/usr/local/include/netax25 but I do not see ../netax25 folder there (or=
=20
anywhere else).

Regards,

Misko YT7MPB

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
