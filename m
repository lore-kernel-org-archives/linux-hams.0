From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] Fix 6pack setting of MAC address
Date: Wed, 24 Aug 2005 18:01:33 +0100
Message-ID: <20050824170133.GA7427@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: linux-hams@vger.kernel.org

Don't check type of sax25_family; dev_set_mac_address has already done
that before and anyway, the type to check against would have been
ARPHRD_AX25.  We only got away because AF_AX25 and ARPHRD_AX25 both happen
to be defined to the same value.

Don't check sax25_ndigis either; it's value is insignificant for the
purpose of setting the MAC address and the check has shown to break
some application software for no good reason.

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 drivers/net/hamradio/6pack.c |    6 ------
 1 files changed, 6 deletions(-)

Index: linux-cvs/drivers/net/hamradio/6pack.c
===================================================================
--- linux-cvs.orig/drivers/net/hamradio/6pack.c
+++ linux-cvs/drivers/net/hamradio/6pack.c
@@ -308,12 +308,6 @@ static int sp_set_mac_address(struct net
 {
 	struct sockaddr_ax25 *sa = addr;
 
-	if (sa->sax25_family != AF_AX25)
-		return -EINVAL;
-
-	if (!sa->sax25_ndigis)
-		return -EINVAL;
-
 	spin_lock_irq(&dev->xmit_lock);
 	memcpy(dev->dev_addr, &sa->sax25_call, AX25_ADDR_LEN);
 	spin_unlock_irq(&dev->xmit_lock);
