From: Bernd Driegert <bd@cool.de>
Subject: [RFC][PATCH] mkiss.[ch]
Date: Sun, 12 Jan 2003 15:26:42 +0100
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <3E217B22.7040309@cool.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel@vger.kernel.org
Cc: linux-hams@vger.kernel.org

The following patch does (hopefully):
1) change MOD_xxx_USE_COUNT to module calls
2) change cli() to use spin_lock

Can someone check:
a) ist it right in terms of usage (it's my first try for cleanup)
b) does it work with the appropriate HW, since im no ham-guy

Bernd

--- linux-2.5.56/drivers/net/hamradio/mkiss.h   Sun Jan 12 14:22:50 2003
+++ mkiss.h     Sun Jan 12 14:24:22 2003
@@ -55,6 +55,7 @@
  #define CRC_MODE_NONE   0
  #define CRC_MODE_FLEX   1
  #define CRC_MODE_SMACK  2
+       spinlock_t      driver_lock;
  };

  #define AX25_MAGIC             0x5316
--- linux-2.5.56/drivers/net/hamradio/mkiss.c   Mon Nov 18 05:29:57 2002
+++ mkiss.c     Sun Jan 12 15:55:06 2003
@@ -253,8 +253,7 @@
                 return;
         }

-       save_flags(flags);
-       cli();
+       spin_lock_irqsave(&ax->driver_lock, flags);

         oxbuff    = ax->xbuff;
         ax->xbuff = xbuff;
@@ -285,7 +284,7 @@
         ax->mtu      = dev->mtu + 73;
         ax->buffsize = len;

-       restore_flags(flags);
+       spin_unlock_irqrestore(&ax->driver_lock, flags);

         if (oxbuff != NULL)
                 kfree(oxbuff);
@@ -676,7 +675,7 @@
                 tmp_ax->mkiss = ax;
         }

-       MOD_INC_USE_COUNT;
+       try_module_get(THIS_MODULE);

         /* Done.  We have linked the TTY line to a channel. */
         return ax->dev->base_addr;
@@ -696,7 +695,7 @@
         ax->tty        = NULL;

         ax_free(ax);
-       MOD_DEC_USE_COUNT;
+       module_put(THIS_MODULE);
  }


