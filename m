From: Jeroen Vreeken <pe1rxq@amsat.org>
Subject: [PATCH] mkiss reinit
Date: Wed, 31 Dec 2003 17:01:56 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <20031231170156.A3527@jeroen.pe1rxq.ampr.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="AWniW0JNca5xppdA"
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
To: jgarzik@pobox.com
Cc: linux-hams@vger.kernel.org, ralf@linux-mips.org


--AWniW0JNca5xppdA
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

Hi,

This is a little patch to fix a netdev register problem with the mkiss
driver.
The problem occurs when kissattach is killed and then restarted.
mkiss only initialized the netdevice structre the first time and thus
trigger a BUG() in register_netdevice()

Jeroen

--AWniW0JNca5xppdA
Content-Type: application/octet-stream; charset=us-ascii
Content-Disposition: attachment; filename="mkiss.2.6.0.rxq.diff"

--- linux-2.6.0.rxq.applied/drivers/net/hamradio/mkiss.c	2003-12-31 16:35:40.000000000 +0100
+++ linux-2.6.0.rxq/drivers/net/hamradio/mkiss.c	2003-12-31 16:18:54.000000000 +0100
@@ -167,17 +167,17 @@
 	/* If no channels are available, allocate one */
 	if (axp == NULL && (ax25_ctrls[i] = kmalloc(sizeof(ax25_ctrl_t), GFP_KERNEL)) != NULL) {
 		axp = ax25_ctrls[i];
-		memset(axp, 0, sizeof(ax25_ctrl_t));
-
-		/* Initialize channel control data */
-		set_bit(AXF_INUSE, &axp->ctrl.flags);
-		sprintf(axp->dev.name, "ax%d", i++);
-		axp->ctrl.tty      = NULL;
-		axp->dev.base_addr = i;
-		axp->dev.priv      = (void *)&axp->ctrl;
-		axp->dev.next      = NULL;
-		axp->dev.init      = ax25_init;
 	}
+	memset(axp, 0, sizeof(ax25_ctrl_t));
+
+	/* Initialize channel control data */
+	set_bit(AXF_INUSE, &axp->ctrl.flags);
+	sprintf(axp->dev.name, "ax%d", i++);
+	axp->ctrl.tty      = NULL;
+	axp->dev.base_addr = i;
+	axp->dev.priv      = (void *)&axp->ctrl;
+	axp->dev.next      = NULL;
+	axp->dev.init      = ax25_init;
 
 	if (axp != NULL) {
 		/*

--AWniW0JNca5xppdA--

