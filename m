From: Hans-Joachim Hetscher <me@privacy.net>
Subject: [PATCH] 2.5.75 6PACK
Date: Sat, 26 Jul 2003 08:10:27 +0200
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3F221B53.7000504@privacy.net>
Reply-To: hajohe@imail.de
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050408050701050602000903"
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-hams@vger.kernel.org

This is a multi-part message in MIME format.
--------------050408050701050602000903
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,

the Hamradio 6pack driver wasn't modified to work with the 1000 HZ
internal kernel timebase.

So here the patch to solve this little problem

vy 73 de Hans-Joachim

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/IhtT3VQwVx4wircRAk2FAJ99nrAIqEQUrHCZk1DPRLcKRulvlwCfbtbH
UOa/Qp704Ac6UXudrfoOEl8=
=eL+I
-----END PGP SIGNATURE-----

--------------050408050701050602000903
Content-Type: text/plain;
 name="6pack.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="6pack.diff"

--- linux/drivers/net/hamradio/6pack.c.ori	2003-07-19 08:00:05.000000000 +0200
+++ linux/drivers/net/hamradio/6pack.c	2003-07-25 07:35:27.000000000 +0200
@@ -67,11 +67,11 @@
 #define SIXP_DAMA_OFF		0
 
 /* default level 2 parameters */
-#define SIXP_TXDELAY			25	/* in 10 ms */
+#define SIXP_TXDELAY			0.25*HZ	/* in 1 s */
 #define SIXP_PERSIST			50	/* in 256ths */
-#define SIXP_SLOTTIME			10	/* in 10 ms */
-#define SIXP_INIT_RESYNC_TIMEOUT	150	/* in 10 ms */
-#define SIXP_RESYNC_TIMEOUT		500	/* in 10 ms */
+#define SIXP_SLOTTIME			0.1*HZ	/* in 1 s */
+#define SIXP_INIT_RESYNC_TIMEOUT	1.5*HZ	/* in 1 s */
+#define SIXP_RESYNC_TIMEOUT		5*HZ	/* in 1 s */
 
 /* 6pack configuration. */
 #define SIXP_NRUNIT			31      /* MAX number of 6pack channels */

--------------050408050701050602000903--

