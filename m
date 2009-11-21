From: Bernard Pidoux <bpidoux@free.fr>
Subject: [PATCH] net-tools-1.60-23 hostname
Date: Sat, 21 Nov 2009 17:58:15 +0100
Message-ID: <4B081C27.3060903@free.fr>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080502070401070203080203"
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
To: linux-hams <linux-hams@vger.kernel.org>, C Schuman <k4gbb1@embarqmail.com>, Jerry DeLong <KD4YAL@tampabay.rr.com>, Ray Wells <vk2tv@exemail.com.au>, Terry Dawson VK2KTJ <terry@animat>

This is a multi-part message in MIME format.
--------------080502070401070203080203
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When compiling the following source 
http://packages.debian.org/sid/net-tools

version 1.60 orig plus -23 patch

I found a few bugs.

Here follows three patches.

73 de Bernard, f6bvp





--------------080502070401070203080203
Content-Type: text/plain;
 name="net-tools-1.60-23.hostname.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="net-tools-1.60-23.hostname.patch"

diff -ruN net-tools-1.60-23/hostname.c net-tools-1.60-23/hostname.c
--- net-tools-1.60-23/hostname.c	2001-04-08 19:04:23.000000000 +0200
+++ net-tools-1.60-23/hostname.c	2009-11-21 16:01:09.693168634 +0100
@@ -31,6 +31,7 @@
  *              your option) any later version.
  */
 #include <stdio.h>
+#include <stdlib.h>
 #include <unistd.h>
 #include <getopt.h>
 #include <string.h>
@@ -98,6 +99,7 @@
 	    fprintf(stderr, _("%s: name too long\n"), program_name);
 	    break;
 	default:
+	    break;
 	}
 	exit(1);
     };
@@ -117,6 +119,7 @@
 	    fprintf(stderr, _("%s: name too long\n"), program_name);
 	    break;
 	default:
+	    break;
 	}
 	exit(1);
     };
@@ -174,6 +177,7 @@
 	printf("%s\n", hp->h_name);
 	break;
     default:
+	break;
     }
 }
 

--------------080502070401070203080203--
