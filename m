From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: Re: Compilin ax25-tools
Date: Sat, 14 Feb 2004 11:58:04 +0000
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <402E0D4C.6050503@ccr.jussieu.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000909090702010300060707"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: oh1mrr@nic.fi
Cc: linux-hams <linux-hams@vger.kernel.org>

This is a multi-part message in MIME format.
--------------000909090702010300060707
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jarmo,

Did you succeed in compiling ax25-tools.0.0.8 with kernel 2.6 ?

Using Mandrake Linux 10 rc2 I had to apply the attached patch for compiling
ax25-tools.0.0.8

73 de Bernard, f6bvp

--------------000909090702010300060707
Content-Type: text/plain;
 name="ax25-tools-2.6.1-0.0.8.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25-tools-2.6.1-0.0.8.diff"

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


--------------000909090702010300060707--

