From: Bernard Pidoux <bernard.pidoux@upmc.fr>
Subject: Re: [PATCH] ax25ipd
Date: Sat, 06 Mar 2010 20:30:30 +0100
Message-ID: <4B92AD56.90909@upmc.fr>
References: <4B929B44.8090003@upmc.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <4B929B44.8090003@upmc.fr>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Cathryn Mataga <cathryn@junglevision.com>
Cc: linux-hams <linux-hams@vger.kernel.org>

Hi,

Sorry, I forgot to include the patch of configure file.

--- ax25-apps-0.0.8-rc2/configure       2009-06-21 20:18:29.000000000 +0200
+++ ax25-apps-0.0.8-rc2.ax25ipd.dyndns/configure        2010-03-06 
13:59:19.000000000 +0100
@@ -13437,7 +13437,7 @@

 if test "x$GCC" = "xyes"; then
   if test -z "`echo "$CFLAGS" | grep "\-Wall" 2> /dev/null`" ; then
-    CFLAGS="$CFLAGS -Wall"
+    CFLAGS="$CFLAGS -Wall -pthread"
   fi
 fi


Bernard Pidoux

