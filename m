From: "Neville Cross" <neville@guegue.com>
Subject: FPAC and Fedora8
Date: Sun, 20 Apr 2008 12:43:39 -0600 (CST)
Message-ID: <9891.165.98.185.2.1208717019.squirrel@mail.guegue.com>
References: <480A6034.1080806@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <480A6034.1080806@ccr.jussieu.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-hams <linux-hams@vger.kernel.org>

Hello,

I have trying to setup a FBB station using Fedora 8. The good thing is
that Fedora has the ax25 protocol already configured as module, it is
matter only to call it up. I already have working ax25 outbound
connections via RF.

In my different test I came to the problem of configuring other  items =
as
ax25d and and ax25ipd. A friend TI2HAS commented to me that a good way =
to
ensure the connections was using FPAC as node, and it will also serve a=
s
gateway.

So I gave a try to FPAC looking the mini-howto at
http://rose.fpac.free.fr/MINI-HOWTO
and also looking the howto at http://ftp.f6fbb.org/fpac/doc/FPAC-HOWTO.=
html

Some of the questions that I have are:
How do I know numbers to use? There is any coordinator to ask?

But beyond those question I got stuck with the command make. I got erro=
rs,
I am not sure what they meant. I tried to modify the make.confs file to
adapt the path to my setup but still no luck. I think that I may have a
problem with something that I have installed or I have not installed.

I will appreciate any comments, ideas or suggestions. Please see below =
the
response from the system.

Thanks in advance.

Neville - YN1V
Sysop of YN1BBS

----------------------------------------------

[root@localhost fpac327.13]# make
make[1]: Entering directory `/usr/local/src/ax25/fpac327.13/lib'
gcc -Wall -Wstrict-prototypes -I../lib -I/usr/include -c libwp.c
In file included from /usr/include/netax25/axlib.h:29,
                 from ax25compat.h:33,
                 from libwp.c:22:
/usr/include/netax25/ax25.h:74: error: conflicting types for =91ax25_ad=
dress=92
/usr/include/linux/ax25.h:47: error: previous declaration of
=91ax25_address=92 was here
/usr/include/netax25/ax25.h:77: error: redefinition of =91struct sockad=
dr_ax25=92
/usr/include/netax25/ax25.h:87: error: redefinition of =91struct
full_sockaddr_ax25=92
/usr/include/netax25/ax25.h:94: error: redefinition of =91struct
ax25_routes_struct=92
/usr/include/netax25/ax25.h:103: error: redefinition of =91struct
ax25_ctl_struct=92
/usr/include/netax25/ax25.h:114: error: redefinition of =91struct
ax25_info_struct=92
/usr/include/netax25/ax25.h:125: error: redefinition of =91struct
ax25_fwd_struct=92
/usr/include/netax25/ax25.h:132: error: redefinition of =91struct
ax25_route_opt_struct=92
In file included from /usr/include/netax25/axlib.h:30,
                 from ax25compat.h:33,
                 from libwp.c:22:
/usr/include/netrose/rose.h:68: error: conflicting types for =91rose_ad=
dress=92
/usr/include/linux/rose.h:44: error: previous declaration of
=91rose_address=92 was here
/usr/include/netrose/rose.h:71: error: redefinition of =91struct sockad=
dr_rose=92
/usr/include/netrose/rose.h:80: error: redefinition of =91struct
full_sockaddr_rose=92
/usr/include/netrose/rose.h:89: error: redefinition of =91struct
rose_route_struct=92
/usr/include/netrose/rose.h:99: error: redefinition of =91struct
rose_cause_struct=92
/usr/include/netrose/rose.h:105: error: redefinition of =91struct
rose_facilities_struct=92
libwp.c: In function =91wp_update_addr=92:
libwp.c:762: warning: passing argument 1 of =91wp_get=92 from incompati=
ble
pointer type
libwp.c: At top level:
libwp.c:776: error: conflicting types for =91wp_search=92
wp.h:116: error: previous declaration of =91wp_search=92 was here
libwp.c: In function =91wp_search=92:
libwp.c:780: warning: passing argument 1 of =91wp_get=92 from incompati=
ble
pointer type
libwp.c: At top level:
libwp.c:870: error: conflicting types for =91wp_get=92
wp.h:110: error: previous declaration of =91wp_get=92 was here
libwp.c: In function =91wp_get=92:
libwp.c:880: error: incompatible types in assignment
make[1]: *** [libwp.o] Error 1
make[1]: Leaving directory `/usr/local/src/ax25/fpac327.13/lib'
make: *** [all] Error 2
[root@localhost fpac327.13]#

--
To unsubscribe from this list: send the line "unsubscribe linux-hams" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
