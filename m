From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] ax25 Locking fix
Date: Fri, 13 Feb 2004 23:48:06 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040213234806.J220@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+fexcqMh/evT6CrY"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: davem@redhat.com
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org


--+fexcqMh/evT6CrY
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a oneliner for 2.6 changing an unlock into a lock.
This prevents an oops on removal of the ax25 module.

Jeroen

--+fexcqMh/evT6CrY
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="ax25.2.6.1.rxq3.diff"

--- linux-2.6.1.org/net/ax25/ax25_route.c	2004-01-09 07:59:46.000000000 +0100
+++ linux-2.6.1-rxq3/net/ax25/ax25_route.c	2004-02-12 20:14:31.000000000 +0100
@@ -535,7 +535,7 @@
 {
 	ax25_route *s, *ax25_rt = ax25_route_list;
 
-	write_unlock(&ax25_route_lock);
+	write_lock(&ax25_route_lock);
 	while (ax25_rt != NULL) {
 		s       = ax25_rt;
 		ax25_rt = ax25_rt->next;

--+fexcqMh/evT6CrY--

