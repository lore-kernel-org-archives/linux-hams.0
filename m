From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: Re: Linux kernel 2.6rc1 and USCC>4/ISA
Date: Sun, 4 Jan 2004 17:28:38 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040104172838.A5056@jeroen.pe1rxq.ampr.org>
References: <3FF6A1CA.9060003@geofizyka.pl> <20040103174125.A211@jeroen.pe1rxq.ampr.org> <3FF6F7C8.9000006@geofizyka.pl> <20040103202602.C211@jeroen.pe1rxq.ampr.org> <3FF7271D.2070103@geofizyka.pl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <3FF7271D.2070103@geofizyka.pl>; from sp2ong@geofizyka.pl on Sat, Jan 03, 2004 at 21:33:33 +0100
List-Id: <linux-hams.vger.kernel.org>
To: sp2ong@geofizyka.pl
Cc: linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 2004.01.03 21:33:33 +0100 sp2ong@geofizyka.pl wrote:
> Hi,
> 
> Thank you for patches and I have recompiled kernel 2.6.1-rc1 with this 
> patches and now USCC card working ! But in log I saw some worning after 
> init USCC:
> 
> AX.25: Z8530 SCC driver version 3.0.dl1bke
> mkiss: AX.25 Multikiss, Hans Albas PE1AYX
> scc0: data port = 0x300  control port = 0x304 -- found
> scc1: data port = 0x301  control port = 0x305 -- found
> scc2: data port = 0x302  control port = 0x306 -- found
> scc3: data port = 0x303  control port = 0x307 -- found
> Init Z8530 driver: 4 channels, IRQ 7
> Uninitialised timer!

Can you try the attached patch? It should fix the warnings.

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="scc-linux-2.6.0.rxq2.diff"

--- linux-2.6.0.rxq.applied/drivers/net/hamradio/scc.c	2003-12-31 16:35:40.000000000 +0100
+++ linux-2.6.0.rxq/drivers/net/hamradio/scc.c	2004-01-04 17:04:20.000000000 +0100
@@ -1525,5 +1526,7 @@
 	dev->priv = scc;
 	scc->dev = dev;
 	spin_lock_init(&scc->lock);
+	init_timer(&scc->tx_t);
+	init_timer(&scc->tx_wdog);
 

--AWniW0JNca5xppdA--

