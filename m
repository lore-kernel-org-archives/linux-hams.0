From: Bob Brose N0QBJ <linuxhams@n0qbj-11.ampr.org>
Subject: [PATCH] ax25 fix char type assumption in ax25_digi structure
Date: 3 Oct 2005 03:51:20 -0000
Message-ID: <20051003035120.21386.qmail@kunk.qbjnet.com>
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

This trivial fix allows ax25 IP to work on the PPC architecture.
The patch is against 2.6.14-rc1 and works with a offset against
2.6.14-rc3 as well. 

If not explicitly declared, PPC assumes chars are unsigned.
x86 assumes they are signed. The code in ax25_addr.c uses -1 with
char lastrepeat in the ax25_digi struct which fails later comparisons
to -1 on PPC. Explicitly declaring the char as signed char fixes the
problem.

If someone could direct this upstream it would be nice...

--- linux/include/net/ax25.h.orig	2005-10-02 13:20:06.000000000 -0500
+++ linux/include/net/ax25.h	2005-10-02 13:20:37.000000000 -0500
@@ -171,7 +171,7 @@
 	ax25_address		calls[AX25_MAX_DIGIS];
 	unsigned char		repeated[AX25_MAX_DIGIS];
 	unsigned char		ndigi;
-	char			lastrepeat;
+	signed char		lastrepeat;
 } ax25_digi;
 
 typedef struct ax25_route {
