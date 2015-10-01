From: jc@eclis.ch
Subject: [PATCH 1/1] Force mkiss to reset the line discipline when serial device is removed
Date: Thu,  1 Oct 2015 04:56:20 +0200
Message-ID: <1443668180-1283-1-git-send-email-jc@eclis.ch>
References: <560C6A79.4070400@eclis.ch>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <560C6A79.4070400@eclis.ch>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>
Cc: Ralf Baechle DL5RB <ralf@linux-mips.org>, linux-hams@trinnet.net, linux-hams@vger.kernel.org

From: Jean-Christian de Rivaz <jc@eclis.ch>

Without the TTY_DRIVER_RESET_TERMIOS in the tty driver flags, the
ax_open() is called again and a new unconfigured interface replace the
one that was just deleted. Since this parasit interface is not linked
to any serial device, when a packet is send the kernel will panic.

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
 drivers/net/hamradio/mkiss.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index 216bfd3..788f43e 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -612,6 +612,11 @@ static int ax_open(struct net_device *dev)
 
 	ax->flags   &= (1 << AXF_INUSE);      /* Clear ESCAPE & ERROR flags */
 
+	/* Will force N_TTY discipline in tty_ldisc_hangup() to avoid
+	 * tty_ldisc_reinit() call ax_open() again when the serial
+	 * device is removed */
+	ax->tty->driver->flags |= TTY_DRIVER_RESET_TERMIOS;
+
 	spin_lock_init(&ax->buflock);
 
 	return 0;
-- 
1.7.10.4

