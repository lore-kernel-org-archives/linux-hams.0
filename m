From: Julia Lawall <julia@diku.dk>
Subject: [PATCH 5/11] drivers/net/hamradio/6pack.c: Move a dereference below
 a NULL test
Date: Tue, 16 Dec 2008 16:13:31 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812161613100.20444@pc-004.diku.dk>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758240AbYLPPNt@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ajk@iehk.rwth-aachen.de, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E == NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/hamradio/6pack.c        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/net/hamradio/6pack.c b/drivers/net/hamradio/6pack.c
index 0f501d2..df7e8de 100644
--- a/drivers/net/hamradio/6pack.c
+++ b/drivers/net/hamradio/6pack.c
@@ -718,11 +718,12 @@ static int sixpack_ioctl(struct tty_struct *tty, struct file *file,
 	unsigned int cmd, unsigned long arg)
 {
 	struct sixpack *sp = sp_get(tty);
-	struct net_device *dev = sp->dev;
+	struct net_device *dev;
 	unsigned int tmp, err;
 
 	if (!sp)
 		return -ENXIO;
+	dev = sp->dev;
 
 	switch(cmd) {
 	case SIOCGIFNAME:
