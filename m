From: Dan Cross <crossd@gmail.com>
Subject: NET/ROM bug fix from YO2LOJ?
Date: Thu, 18 Nov 2021 16:39:11 +0000
Message-ID: <27764.1637253551@yamaloka.gajendra.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-hams-owner@vger.kernel.org>
Content-ID: <17057.1637252655.1@local.net>
List-ID: <linux-hams.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org

On October 26 2021, N1URO sent a message to this list asking
about getting "the NetRom status bug" fixed.  There was no
additional context, so perhaps it's unsurprising that no one
responded.

However, his message appears to refer to a legitimate bug in
which NET/ROM sockets can be left in an invalid state after
closing.  Marius Petrescu, YO2LOJ, has a small patch for this
on his web site, but from my searching, I can't find any record
that it ever made it to either this list or the LKML.

Marius's fix is short (slightly reformatted for kernels style):

--- ../reference/linux/net/ax25/ax25_subr.c	Thu Nov 18 15:33:53 2021
+++ ax25_subr.c	Thu Nov 18 16:05:36 2021
@@ -284,5 +284,8 @@
 		}
 		bh_unlock_sock(ax25->sk);
 		local_bh_enable();
+	} else {
+		// YO2LOJ: this is needed for proper NETROM connection cleanup on timeout
+		ax25_destroy_socket(ax25);
 	}
 }

I do not know whether this is the _right_ fix for this issue,
but it seems that additional context towards getting it fixed
would be helpful, hence this message.

Is anyone tracking this issue?

Thanks and 73,

	- Dan C.
	  (KZ2X)

