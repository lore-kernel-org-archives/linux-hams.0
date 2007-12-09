From: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Subject: [PATCH]  ax25ipd (ax25-apps-0.0.6.2)
Date: Sun, 09 Dec 2007 21:59:32 +0100
Message-ID: <475C5734.4060306@ccr.jussieu.fr>
References: <47556E09.1050007@openvz.org> <20071205.021741.176966054.davem@davemloft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20071205.021741.176966054.davem@davemloft.net>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-hams <linux-hams@vger.kernel.org>
Cc: C Schuman <k4gbb1@earthlink.net>, Ray Wells <vk2tv@exemail.com.au>, "kd4yal@tampabay.rr.com" <kd4yal@tampabay.rr.com>

Hi,

I found that my previous patch for ax25ipd did not give good results.
Here is the new patch.


diff -ruN ax25-apps-0.0.6.2/ax25ipd/ax25ipd.h 
ax25-apps-0.0.6.2b/ax25ipd/ax25ipd.h
--- ax25ipd/ax25ipd.h	2005-12-23 21:21:40.000000000 +0100
+++ ax25ipd/ax25ipd.h	2007-12-06 11:21:58.000000000 +0100
@@ -41,7 +41,7 @@
   *
   */

-#define VERS2 "Version 1.0.3"
+#define VERS2 "Version 1.0.5"

  #define IPPROTO_AX25 93
  #define DEFAULT_UDP_PORT 10093
diff -ruN ax25-apps-0.0.6.2/ax25ipd/config.c 
ax25-apps-0.0.6.2b/ax25ipd/config.c
--- ax25ipd/config.c	2005-12-23 21:21:41.000000000 +0100
+++ ax25ipd/config.c	2007-12-09 13:55:41.000000000 +0100
@@ -310,8 +310,8 @@
                          strncpy(thost,q,255);
                          thost[255]=0;
                     } else {
-                        return -5;
-                        }
+			fprintf(stderr,"ax25ipd: %s host IP address unknown - will probe it 
again later\n",q);
+		   }
  		}

  		while ((q = strtok(NULL, " \t\n\r")) != NULL) {
diff -ruN ax25-apps-0.0.6.2/ax25ipd/HISTORY.ax25ipd 
ax25-apps-0.0.6.2b/ax25ipd/HISTORY.ax25ipd
--- ax25ipd/HISTORY.ax25ipd	2005-12-23 21:21:41.000000000 +0100
+++ ax25ipd/HISTORY.ax25ipd	2007-12-06 11:27:02.000000000 +0100
@@ -49,6 +49,11 @@
   *              on UDP port. Also deleted exit(3) for errors occuring 
with
   *		kiss serial port (f6bvp).
   *
+ *	1.0.4	when started the program stopped if resolving host ip from
+ *		its hostname was unsuccessful (f6bvp).
+ *		Replaced this by a simple error warning as the remote host could
+ *		be temporary down and the address will be checked again later.
+ *
   *      July97  Added support for broadcast addresses and routes.
   *              Converted route array to a linked list and removed the
   *              maximum route limitations. (vk2ktj)


73 de Bernard, f6bvp


