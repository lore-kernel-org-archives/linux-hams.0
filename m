From: David Ranch <linux-hams@trinnet.net>
Subject: Re: [PATCH v05 69/72] uapi rose.h: glibc netrose/rose.h header file
 compatibility fixes
Date: Wed, 16 Nov 2016 14:17:48 -0800
Message-ID: <6dffbcc1-c789-9df2-646e-29ed618b9070@trinnet.net>
References: <1471890809-4383-1-git-send-email-mikko.rapeli@iki.fi>
 <1471890809-4383-70-git-send-email-mikko.rapeli@iki.fi>
 <57C06258.8000807@bfs.de> <20160828055918.GZ5399@lakka.kapsi.fi>
 <65db8f70-0533-3edb-11da-5795b986a460@trinnet.net>
 <20161116190746.GM8342@lakka.kapsi.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20161116190746.GM8342@lakka.kapsi.fi>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mikko Rapeli <mikko.rapeli@iki.fi>
Cc: walter harms <wharms@bfs.de>, linux-kernel@vger.kernel.org, linux-hams@vger.kernel.org


Hello Mikko,

It would be great to see a solution to this long standing issue.  I 
would highlight that we have two pockets of AX.25 that need to be 
considered aligned IMHO:

#Official AX.25 repo but sometimes doesn't include all available fixes
http://git.linux-ax25.org/cgit/libax25.git/tree/netax25/ax25.h

#Unofficial AX.25 repo which sometimes has more fixes
https://github.com/ve7fet/linuxax25/blob/master/libax25/netax25/ax25.h

#Current Glibc version
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=sysdeps/unix/sysv/linux/netax25/ax25.h;hb=HEAD


Fortunately, it looks like both of these repos have the same file 
(confirmed with a diff).  Comparing to the Glibc versio, the differences 
are minimal:


diff -u ax25.h-officialax25 ax25.h-glibc
--- ax25.h-officialax25 2016-11-16 13:53:27.000000000 -0800
+++ ax25.h-glibc        2016-11-16 14:14:03.000000000 -0800
@@ -1,4 +1,4 @@
-/* Copyright (C) 1997, 1999 Free Software Foundation, Inc.
+/* Copyright (C) 1997-2016 Free Software Foundation, Inc.
     This file is part of the GNU C Library.

     The GNU C Library is free software; you can redistribute it and/or
@@ -12,15 +12,14 @@
     Lesser General Public License for more details.

     You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, write to the Free
-   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
-   02111-1307 USA.  */
+   License along with the GNU C Library; if not, see
+   <http://www.gnu.org/licenses/>.  */

  #ifndef _NETAX25_AX25_H
  #define _NETAX25_AX25_H        1

  #include <features.h>
-#include <sys/socket.h>
+#include <bits/sockaddr.h>

  /* Setsockoptions(2) level.  Thanks to BSD these must match 
IPPROTO_xxx.  */
  #define SOL_AX25       257


--David
