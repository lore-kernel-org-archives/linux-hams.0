From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] 6pack reinit bug
Date: Wed, 11 Feb 2004 23:25:58 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20040211232558.C200@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: jgarzik@pobox.com
Cc: linux-hams@vger.kernel.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This patch is the same as to mkiss a while ago, the current code triggers a
bug when reattaching a network device.

Please apply.

Thanks,
Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="hamradio.2.6.1.rxq3.diff"

--- linux-2.6.1-rxq2/drivers/net/hamradio/6pack.c	2004-01-21 20:47:09.000000000 +0100
+++ linux-2.6.1-rxq3/drivers/net/hamradio/6pack.c	2004-02-06 19:32:46.000000000 +0100
@@ -178,17 +178,17 @@
 	    (sixpack_ctrls[i] = (sixpack_ctrl_t *)kmalloc(sizeof(sixpack_ctrl_t),
 						    GFP_KERNEL)) != NULL) {
 		spp = sixpack_ctrls[i];
-		memset(spp, 0, sizeof(sixpack_ctrl_t));
-
-		/* Initialize channel control data */
-		set_bit(SIXPF_INUSE, &spp->ctrl.flags);
-		spp->ctrl.tty         = NULL;
-		sprintf(spp->dev.name, "sp%d", i);
-		spp->dev.base_addr    = i;
-		spp->dev.priv         = (void *) &spp->ctrl;
-		spp->dev.next         = NULL;
-		spp->dev.init         = sixpack_init;
 	}
+	memset(spp, 0, sizeof(sixpack_ctrl_t));
+
+	/* Initialize channel control data */
+	set_bit(SIXPF_INUSE, &spp->ctrl.flags);
+	spp->ctrl.tty         = NULL;
+	sprintf(spp->dev.name, "sp%d", i);
+	spp->dev.base_addr    = i;
+	spp->dev.priv         = (void *) &spp->ctrl;
+	spp->dev.next         = NULL;
+	spp->dev.init         = sixpack_init;
 
 	if (spp != NULL) {
 		/* register device so that it can be ifconfig'ed       */

--AWniW0JNca5xppdA--

