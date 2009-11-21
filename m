From: Bernard Pidoux <bpidoux@free.fr>
Subject: [PATCH] net-tools-1.60-23 netstat x25_sr
Date: Sat, 21 Nov 2009 17:59:44 +0100
Message-ID: <4B081C80.7010907@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040507000804030104070603"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>, C Schuman <k4gbb1@embarqmail.com>, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, Terry Dawson VK2KTJ <terry@animat>

This is a multi-part message in MIME format.
--------------040507000804030104070603
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When compiling the following source 
http://packages.debian.org/sid/net-tools

version 1.60 orig plus -23 patch

I found a few bugs.

Here follows three patches.

73 de Bernard, f6bvp







--------------040507000804030104070603
Content-Type: text/plain;
 name="net-tools-1.60-23.netstat.x25_sr.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="net-tools-1.60-23.netstat.x25_sr.patch"

--- net-tools-1.60-23/lib/x25_sr.c	2000-05-20 15:38:10.000000000 +0200
+++ net-tools-1.60-23/lib/x25_sr.c	2009-11-20 16:36:22.253146541 +0100
@@ -77,7 +77,7 @@
   rt.sigdigits=sigdigits;
 
   /* x25_route_struct.address isn't type struct sockaddr_x25, Why? */
-  memcpy(&rt.address, &sx25.sx25_addr, sizeof(x25_address));
+  memcpy(&rt.address, &sx25.sx25_addr, sizeof(sx25.sx25_addr));
 
   while (*args) {
 	if (!strcmp(*args,"device") || !strcmp(*args,"dev")) {

--------------040507000804030104070603--
