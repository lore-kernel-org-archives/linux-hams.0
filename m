From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [PATCH] ax25ipd : added provision for dynamic dns hosts
Date: Tue, 03 Nov 2009 14:33:40 +0100
Message-ID: <4AF03134.7010300@upmc.fr>
References: <C5A3335A.25066%teners@bh90210.net> <4AE1AA6C.9040500@upmc.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080702010909030206050202"
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4AE1AA6C.9040500@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams@vger.kernel.org
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, ax25@x-berg.in-berlin.de

This is a multi-part message in MIME format.
--------------080702010909030206050202
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

In the submitted patch io.c patch was malformed.

Here is a corrected patch for ax25ipd/io.c

73 de Bernard, f6bvp



--------------080702010909030206050202
Content-Type: text/plain;
 name="ax25ipd-0.0.8-rc2_io.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ax25ipd-0.0.8-rc2_io.patch"

--- ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-06-14 17:42:11.000000000 +0200
+++ ax25-apps-0.0.8-rc2/ax25ipd/io.c	2009-11-03 14:03:40.890816311 +0100
@@ -15,7 +15,6 @@
 
 #include <sys/types.h>
 #include <sys/time.h>
-#include <time.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <netinet/in_systm.h>
@@ -67,8 +66,7 @@
 struct sockaddr_in from;
 socklen_t fromlen;
 
-time_t last_bc_time;
-
+time_t last_bc_time, last_dns_time;
 int ttyfd_bpq = 0;
 
 /*
@@ -134,6 +132,8 @@
 
 	bzero((char *) &udpbind, sizeof(struct sockaddr));
 	udpbind.sin_family = AF_INET;
+
+        last_dns_time = time(NULL);
 }
 
 /*
@@ -378,9 +378,19 @@
 		if (nb == 0) {
 			fflush(stdout);
 			fflush(stderr);
+/*                      do we need to check hostname->ip mappings? */
+                        if (time(NULL) > last_dns_time + 300) {
+                           update_dns();
+                           last_dns_time = time(NULL); 
+                        }
 			/* just so we go back to the top of the loop! */
 			continue;
 		}
+/*              just in case we've been too busy......... */
+                if (time(NULL) > last_dns_time + 900) {
+                   update_dns();
+                   last_dns_time = time(NULL); 
+                }
 
 		if (FD_ISSET(ttyfd, &readfds)) {
 			do {
@@ -599,8 +609,9 @@
 			perror("reading from raw ip socket");
 			exit(2);
 		} else if (mode == UDP_MODE) {
-			perror("reading from udp socket");
+/*			perror("reading from udp socket");
 			exit(2);
+*/
 		} else if (mode == TTY_MODE) {
 			perror("reading from tty device");
 			exit(2);
@@ -645,8 +656,9 @@
 				usleep(100000);	/* sleep a bit */
 				return 1;	/* and retry */
 			}
-			perror("writing to udp socket");
+/*			perror("writing to udp socket");
 			exit(2);
+*/
 		} else if (mode == TTY_MODE) {
 			if (errno == EWOULDBLOCK) {
 				LOGL4("write to tty would block, sleeping and retrying!\n");

--------------080702010909030206050202--
