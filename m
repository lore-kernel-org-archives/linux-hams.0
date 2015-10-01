From: Jean-Christian de Rivaz <jc@eclis.ch>
Subject: [PATCH v2 1/1] Force mkiss to reset the line discipline when serial device is removed
Date: Thu,  1 Oct 2015 11:18:08 +0200
Message-ID: <1443691088-30478-1-git-send-email-jc@eclis.ch>
References: <20151001073117.GA31401@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <20151001073117.GA31401@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Osterried <thomas@osterried.de>, David Ranch <dranch@trinnet.net>, Ralf Baechle DL5RB <ralf@linux-mips.org>
Cc: linux-hams@trinnet.net, linux-hams@vger.kernel.org

Without the TTY_OTHER_CLOSED in the tty flags, the ax_open() is called
again and a new unconfigured interface replace the one that was just
deleted. Since this parasit interface is not linked to any serial
device, when a packet is send the kernel will panic.

Signed-off-by: Jean-Christian de Rivaz <jc@eclis.ch>
---
 drivers/net/hamradio/mkiss.c |    5 +++++
 drivers/tty/tty_ldisc.c      |    2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index 216bfd3..fba41e9 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -612,6 +612,11 @@ static int ax_open(struct net_device *dev)
 
 	ax->flags   &= (1 << AXF_INUSE);      /* Clear ESCAPE & ERROR flags */
 
+	/* Will force N_TTY discipline in tty_ldisc_hangup() to avoid
+	 * tty_ldisc_reinit() call ax_open() again when the serial
+	 * device is removed */
+	set_bit(TTY_OTHER_CLOSED, &ax->tty->flags);
+
 	spin_lock_init(&ax->buflock);
 
 	return 0;
diff --git a/drivers/tty/tty_ldisc.c b/drivers/tty/tty_ldisc.c
index 71750cb..7a24ab6 100644
--- a/drivers/tty/tty_ldisc.c
+++ b/drivers/tty/tty_ldisc.c
@@ -691,6 +691,8 @@ void tty_ldisc_hangup(struct tty_struct *tty)
 
 	if (tty->ldisc) {
 
+		reset |= test_bit(TTY_OTHER_CLOSED, &tty->flags);
+
 		/* At this point we have a halted ldisc; we want to close it and
 		   reopen a new ldisc. We could defer the reopen to the next
 		   open but it means auditing a lot of other paths so this is
-- 
1.7.10.4

