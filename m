From: Steven Whitehouse <steve@gw.chygwyn.com>
Subject: Patch to add an ax25 device pointer
Date: Sun, 1 Jun 2003 14:38:41 +0100 (BST)
Sender: linux-hams-owner@vger.kernel.org
Message-ID: <200306011338.OAA11251@gw.chygwyn.com>
Reply-To: Steve Whitehouse <Steve@ChyGwyn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Hi,

Here is the first of my patches to clean up AX.25 in 2.5. This one adds a
pointer to struct net_device for AX.25 so that we can easily find
AX.25 specific device info given a net_device.

If nobody tells me that this patch is broken in the next few days or
so then I'll forward it for inclusion in the kernel (likewise if I get
reports of it working, I'll send it earlier). With a bit of luck I'll
be able to find the time to do a few small patches like this over the
next few months to try and bring the code uptodate.

Let me know if you've got any comments/questions,

Steve.

----------------------------------------------------------------------------

diff -Nru linux-2.5.70/include/linux/netdevice.h linux/include/linux/netdevice.h
--- linux-2.5.70/include/linux/netdevice.h	Tue May 27 02:43:51 2003
+++ linux/include/linux/netdevice.h	Sun Jun  1 06:28:41 2003
@@ -335,6 +335,7 @@
 	void                    *dn_ptr;        /* DECnet specific data */
 	void                    *ip6_ptr;       /* IPv6 specific data */
 	void			*ec_ptr;	/* Econet specific data	*/
+	void			*ax25_ptr;	/* AX.25 specific data */
 
 	struct list_head	poll_list;	/* Link to poll list	*/
 	int			quota;
diff -Nru linux-2.5.70/include/net/ax25.h linux/include/net/ax25.h
--- linux-2.5.70/include/net/ax25.h	Tue May 27 02:43:51 2003
+++ linux/include/net/ax25.h	Sun Jun  1 06:28:41 2003
@@ -233,7 +233,12 @@
 /* ax25_dev.c */
 extern ax25_dev *ax25_dev_list;
 extern spinlock_t ax25_dev_lock;
-extern ax25_dev *ax25_dev_ax25dev(struct net_device *);
+
+static inline ax25_dev *ax25_dev_ax25dev(struct net_device *dev)
+{
+	return dev->ax25_ptr;
+}
+
 extern ax25_dev *ax25_addr_ax25dev(ax25_address *);
 extern void ax25_dev_device_up(struct net_device *);
 extern void ax25_dev_device_down(struct net_device *);
diff -Nru linux-2.5.70/net/ax25/ax25_dev.c linux/net/ax25/ax25_dev.c
--- linux-2.5.70/net/ax25/ax25_dev.c	Sat Apr 19 19:48:52 2003
+++ linux/net/ax25/ax25_dev.c	Sun Jun  1 06:28:41 2003
@@ -34,21 +34,6 @@
 ax25_dev *ax25_dev_list;
 spinlock_t ax25_dev_lock = SPIN_LOCK_UNLOCKED;
 
-ax25_dev *ax25_dev_ax25dev(struct net_device *dev)
-{
-	ax25_dev *ax25_dev, *res = NULL;
-
-	spin_lock_bh(&ax25_dev_lock);
-	for (ax25_dev = ax25_dev_list; ax25_dev != NULL; ax25_dev = ax25_dev->next)
-		if (ax25_dev->dev == dev) {
-			res = ax25_dev;
-			break;
-		}
-	spin_unlock_bh(&ax25_dev_lock);
-
-	return res;
-}
-
 ax25_dev *ax25_addr_ax25dev(ax25_address *addr)
 {
 	ax25_dev *ax25_dev, *res = NULL;
@@ -80,6 +65,7 @@
 
 	memset(ax25_dev, 0x00, sizeof(*ax25_dev));
 
+	dev->ax25_ptr     = ax25_dev;
 	ax25_dev->dev     = dev;
 	ax25_dev->forward = NULL;
 
@@ -152,6 +138,7 @@
 		s = s->next;
 	}
 	spin_unlock_bh(&ax25_dev_lock);
+	dev->ax25_ptr = NULL;
 
 	ax25_register_sysctl();
 }
