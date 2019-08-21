From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5bPATCH=5d_hamradio=3a_Delete_unnecessary_checks_before_?=
 =?UTF-8?B?dGhlIG1hY3JvIGNhbGwg4oCcZGV2X2tmcmVlX3NrYuKAnQ==?=
Date: Wed, 21 Aug 2019 22:00:16 +0200
Message-ID: <61fc7b82-dbc0-93e4-bf43-9856eb4c6688@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1566417621;
        bh=UhJ5i7TA1V0uuPUEJy3RpLR3oAsEV5c3daK+sRLgryc=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=Uk8PJJPceFLQVrrW11QgDdA7pZbQcmr1waaerb+4a20Ee4cHWaIh6BPUaEkxmMjHB
         eLWXDBT8M9F8ZBEq6P2i4D0/wmWpWua1OcQvo1Dyj17dw+K0TwyapajyANjVu/OYBC
         VHQT1NVJ8/eyPn6JTX8/MFrcDTk1d9RCKBOnDROM=
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org, netdev@vger.kernel.org, Allison Randal <allison@lohutok.net>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Stewart <kstewart@linuxfoundation.org>, Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Aug 2019 21:48:46 +0200

The dev_kfree_skb() function performs also input parameter validation.
Thus the test around the shown calls is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/hamradio/baycom_epp.c | 3 +--
 drivers/net/hamradio/hdlcdrv.c    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/bayc=
om_epp.c
index 9303aeb2595f..4476491b58f9 100644
=2D-- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -961,8 +961,7 @@ static int epp_close(struct net_device *dev)
 	parport_write_control(pp, 0); /* reset the adapter */
         parport_release(bc->pdev);
         parport_unregister_device(bc->pdev);
-	if (bc->skb)
-		dev_kfree_skb(bc->skb);
+	dev_kfree_skb(bc->skb);
 	bc->skb =3D NULL;
 	printk(KERN_INFO "%s: close epp at iobase 0x%lx irq %u\n",
 	       bc_drvname, dev->base_addr, dev->irq);
diff --git a/drivers/net/hamradio/hdlcdrv.c b/drivers/net/hamradio/hdlcdrv=
.c
index c6f83e0df0a3..df495b5595f5 100644
=2D-- a/drivers/net/hamradio/hdlcdrv.c
+++ b/drivers/net/hamradio/hdlcdrv.c
@@ -475,8 +475,7 @@ static int hdlcdrv_close(struct net_device *dev)

 	if (s->ops && s->ops->close)
 		i =3D s->ops->close(dev);
-	if (s->skb)
-		dev_kfree_skb(s->skb);
+	dev_kfree_skb(s->skb);
 	s->skb =3D NULL;
 	s->opened =3D 0;
 	return i;
=2D-
2.23.0

