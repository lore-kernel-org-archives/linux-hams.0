From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] rcu in bpqether driver.
Date: Mon, 17 Oct 2005 12:42:32 +0100
Message-ID: <20051017114232.GA7888@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Suzanne Wood <suzannew@cs.pdx.edu>, linux-hams@vger.kernel.org

From Suzanne Wood <suzannew@cs.pdx.edu>:

Clarify RCU implementation in bpqether.c.

Because bpq_new_device() calls list_add_rcu() and bpq_free_device() calls
list_del_rcu(), substitute list_for_each_entry_rcu() for
list_for_each_entry() in bpq_get_ax25_dev() and in bpq_seq_start().

Add rcu dereference protection in bpq_seq_next().

The rcu_read_lock()/unlock() in bpq_device_event() are removed because
netdev event handlers are called with RTNL locking in place.

FYI: bpq_free_device() calls list_del_rcu() which, per list.h, requires
synchronize_rcu() which can block or call_rcu() or call_rcu_bh() which
cannot block.  Herbert Xu notes that synchronization is done here by 
unregister_netdevice().  This calls synchronize_net() which in turn uses
synchronize_rcu().

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 drivers/net/hamradio/bpqether.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

Index: net-git/drivers/net/hamradio/bpqether.c
===================================================================
--- net-git.orig/drivers/net/hamradio/bpqether.c
+++ net-git/drivers/net/hamradio/bpqether.c
@@ -144,7 +144,7 @@ static inline struct net_device *bpq_get
 {
 	struct bpqdev *bpq;
 
-	list_for_each_entry(bpq, &bpq_devices, bpq_list) {
+	list_for_each_entry_rcu(bpq, &bpq_devices, bpq_list) {
 		if (bpq->ethdev == dev)
 			return bpq->axdev;
 	}
@@ -399,7 +399,7 @@ static void *bpq_seq_start(struct seq_fi
 	if (*pos == 0)
 		return SEQ_START_TOKEN;
 	
-	list_for_each_entry(bpqdev, &bpq_devices, bpq_list) {
+	list_for_each_entry_rcu(bpqdev, &bpq_devices, bpq_list) {
 		if (i == *pos)
 			return bpqdev;
 	}
@@ -418,7 +418,7 @@ static void *bpq_seq_next(struct seq_fil
 		p = ((struct bpqdev *)v)->bpq_list.next;
 
 	return (p == &bpq_devices) ? NULL 
-		: list_entry(p, struct bpqdev, bpq_list);
+		: rcu_dereference(list_entry(p, struct bpqdev, bpq_list));
 }
 
 static void bpq_seq_stop(struct seq_file *seq, void *v)
@@ -561,8 +561,6 @@ static int bpq_device_event(struct notif
 	if (!dev_is_ethdev(dev))
 		return NOTIFY_DONE;
 
-	rcu_read_lock();
-
 	switch (event) {
 	case NETDEV_UP:		/* new ethernet device -> new BPQ interface */
 		if (bpq_get_ax25_dev(dev) == NULL)
@@ -581,7 +579,6 @@ static int bpq_device_event(struct notif
 	default:
 		break;
 	}
-	rcu_read_unlock();
 
 	return NOTIFY_DONE;
 }
