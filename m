From: Tomi Manninen <oh2bns@sral.fi>
Subject: Re: Linux AX25 Digipeating Software
Date: Wed, 22 Dec 2004 23:30:48 +0200
Message-ID: <1103751047.1219.2.camel@oh2bns.ampr.org>
References: <41C9A12A.2000401@utoronto.ca>
	 <NCBBKBAJDJIPKFIAFBKLIEGOFFAC.wilson.hein@verizon.net>
	 <20041222204955.GC8131@office.n7xy.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-xRpN2a2Q26SKxVEW5bE2"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20041222204955.GC8131@office.n7xy.net>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
To: Linux-hams List <linux-hams@vger.kernel.org>


--=-xRpN2a2Q26SKxVEW5bE2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2004-12-22 at 22:49, Bob Nielsen wrote:

> The binary appears to have been built with libc4 (this thing really is
> old!).  I suspect that it is written for an older version of gcc, as
> well.  The oldest one I have is 2.95 and that bombs, as do 3.2 and 3.3. 
> I'm not a C programmer, so can't reallly help there.

Just a quick and dirty hack... Maybe this works, at least it compiles 
for me now...

-- 
Tomi Manninen / OH2BNS / KP20ME04

--=-xRpN2a2Q26SKxVEW5bE2
Content-Description: 
Content-Disposition: inline; filename=axdigi-0.02.diff
Content-Type: text/x-patch; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

diff -ruN axdigi-0.02.orig/axdigi.c axdigi-0.02/axdigi.c
--- axdigi-0.02.orig/axdigi.c	1997-06-12 19:56:56.000000000 +0300
+++ axdigi-0.02/axdigi.c	2004-12-22 23:24:23.000000000 +0200
@@ -20,17 +20,18 @@
  *        12th June 1997.
  */
 
-#include <linux/if.h>
-#include <linux/if_ether.h>
+#include <net/if.h>
 #include <netinet/in.h>
 #include <sys/ioctl.h>
 #include <sys/socket.h>
 #include <sys/types.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <strings.h>
+#include <string.h>
 #include <unistd.h>
-#include <linux/ax25.h>
+#include <netax25/ax25.h>
+
+#define	ETH_P_AX25	0x0002
 
 int recv_packet(unsigned char *buf, int size, unsigned char *port);
 void print_call(unsigned char *buf);
@@ -250,4 +251,4 @@
 		}
 	} /* for */
 }	
-		
\ No newline at end of file
+		

--=-xRpN2a2Q26SKxVEW5bE2--

