From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: sound card modem on a laptop?
Date: Mon, 19 Jan 2004 00:51:26 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <400B2A0E.8030208@ccr.jussieu.fr>
References: <20040117124207.3584bc09.washer@trlp.com> <1074441674.1290.22.camel@oh2bns.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090904010301080909040804"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <1074441674.1290.22.camel@oh2bns.ampr.org>
List-Id: <linux-hams.vger.kernel.org>
To: Tomi Manninen <oh2bns@sral.fi>
Cc: James Washer <washer@trlp.com>, linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------090904010301080909040804
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Tomi Manninen wrote:
> 
> A comment about 2.6 kernels. Even though I haven't had a chance to try
> it myself yet (lazy me), I have been told that the MKISS driver in the
> 2.6 kernel doesn't compile.
> 
> The kernel mode soundmodem has been removed in 2.6 so you have
> to use the user mode soundmodem [1], and it's better anyway. However, 
> the user mode soundmodem needs the MKISS driver to talk to the kernel.
> So if the driver really does not compile, you can't use 2.6...
> 
> /Tomi

I have been experimenting Mandrake Linux 10.0 rc with kernel 2.6.0 and 
the last AX25 patches
included into 2.6.1 kernel.

Mkiss driver is running well and there was no compilation problem here.

BTW compiling ax25-tools 0.0.8 gave me some warnings I was able to turn 
arround :
In ax25/axspawm.c
#include <sys/time.h> should be changed to
#include <time.h>

In netrom/net2kiss.c
#include <netinet/in.h> was missing
like in hdlcutil/hdrvcomm.c
#include <netinet/in.h> is needed for htons declaration
and looking at other sources I think that
also in hdrvcomm.c
#include <net/ethernet.h> should be modified like this

#ifdef __GLIBC__
#include <net/ethernet.h>
#else
#include <linux/if_ether.h>
#endif

There is another warning about /netrom/kissnetd.c : 106 with
sys_errlist is deprecated ; use strerror or sterror_r instead.

Although I am not familiar with diff I obtained a
diff of the ax25-tools.0.0.8 after I modified it.

73 de bernard, F6BVP


--------------090904010301080909040804
Content-Type: text/plain;
 name="ax25-tools-0.0.8.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25-tools-0.0.8.diff"

diff -ru ax25-tools-0.0.8/ax25/axspawn.c ax25-tools-0.0.8b/ax25/axspawn.c
--- ax25-tools-0.0.8/ax25/axspawn.c	2001-04-10 04:09:28.000000000 +0200
+++ ax25-tools-0.0.8b/ax25/axspawn.c	2004-01-18 21:24:04.000000000 +0100
@@ -124,7 +124,7 @@
 #include <paths.h>
 #include <errno.h>
 #include <syslog.h>
-#include <sys/time.h>
+#include <time.h>
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/ioctl.h>
diff -ru ax25-tools-0.0.8/hdlcutil/hdrvcomm.c ax25-tools-0.0.8b/hdlcutil/hdrvcomm.c
--- ax25-tools-0.0.8/hdlcutil/hdrvcomm.c	2001-04-10 04:10:48.000000000 +0200
+++ ax25-tools-0.0.8b/hdlcutil/hdrvcomm.c	2004-01-18 22:52:46.000000000 +0100
@@ -48,7 +50,14 @@
 #include "hdrvcomm.h"
 #include "usersmdiag.h"
 #include <net/if_arp.h>
+
+#ifdef __GLIBC__
+#include <net/ethernet.h>
+#else
 #include <linux/if_ether.h>
+#endif
+#include <netinet/in.h>
+
 #include <linux/if_packet.h>
 #ifndef SOL_PACKET
 #define SOL_PACKET  263
diff -ru ax25-tools-0.0.8/kiss/net2kiss.c ax25-tools-0.0.8b/kiss/net2kiss.c
--- ax25-tools-0.0.8/kiss/net2kiss.c	2001-04-10 04:10:36.000000000 +0200
+++ ax25-tools-0.0.8b/kiss/net2kiss.c	2004-01-18 22:47:39.000000000 +0100
@@ -49,6 +49,8 @@
 #include <sys/socket.h>
 #include <net/if.h>
 
+#include <netinet/in.h>
+
 #ifdef __GLIBC__
 #include <net/ethernet.h>
 #else


--------------090904010301080909040804--

