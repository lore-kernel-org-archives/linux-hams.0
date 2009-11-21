From: Bernard Pidoux <bpidoux@free.fr>
Subject: [PATCH] net-tools-1.60-23 inet_src
Date: Sat, 21 Nov 2009 17:59:00 +0100
Message-ID: <4B081C54.6010507@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060408000700090402060105"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>, C Schuman <k4gbb1@embarqmail.com>, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, Terry Dawson VK2KTJ <terry@animat>

This is a multi-part message in MIME format.
--------------060408000700090402060105
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When compiling the following source 
http://packages.debian.org/sid/net-tools

version 1.60 orig plus -23 patch

I found a few bugs.

Here follows three patches.

73 de Bernard, f6bvp






--------------060408000700090402060105
Content-Type: text/plain;
 name="net-tools-1.60-23.inet_src.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="net-tools-1.60-23.inet_src.patch"

diff -ruN net-tools-1.60-23/lib/inet_sr.c net-tools-1.60-23/lib/inet_sr.c
--- net-tools-1.60-23/lib/inet_sr.c	2000-02-20 22:46:45.000000000 +0100
+++ net-tools-1.60-23/lib/inet_sr.c	2009-11-21 16:01:09.693168634 +0100
@@ -105,6 +105,7 @@
     case 2:
        isnet = 0; break;
     default:
+       break;
     }
 
     /* Fill in the other fields. */

--------------060408000700090402060105--
