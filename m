From: Richard Stearn <richard@rns-stearn.demon.co.uk>
Subject: [PATCH net-next 1/1] - ROSE device usage count - repost with signoff
Date: Mon, 15 Jun 2015 19:45:34 +0100 (BST)
Message-ID: <201506151845.t5FIjYEl008610@ux4.g1sog>
References: <201505201431.t4KEVQbR014971@ux4.g1sog>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <201505201431.t4KEVQbR014971@ux4.g1sog>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

Whilst investigating couple of issues in AX25 I discovered that
whilst the NETROM driver had been updated to manage the device
usage count the ROSE drive had not.  The result being that the
ROSE driver post kernel 2.4.x would not unload cleanly and
required a reboot to clean up.

As both NETROM and ROSE drivers are broadly similar in design
and implementation I have updated the socket locking and device
usage count management in the ROSE driver to match the NETROM
driver.

git diff against net-next
---
Signed-off-by: Richard W. Stearn richard@rns-stearn.demon.co.uk


diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 36dbc2d..3b90a2d 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -662,23 +662,31 @@ static int rose_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 	ax25_uid_assoc *user;
 	int n;
 
-	if (!sock_flag(sk, SOCK_ZAPPED))
+	lock_sock(sk);
+	if (!sock_flag(sk, SOCK_ZAPPED)) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr_len != sizeof(struct sockaddr_rose) && addr_len != sizeof(struct full_sockaddr_rose))
+	}
+	if (addr_len != sizeof(struct sockaddr_rose) && addr_len != sizeof(struct full_sockaddr_rose)) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr->srose_family != AF_ROSE)
+	}
+	if (addr->srose_family != AF_ROSE) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if (addr_len == sizeof(struct sockaddr_rose) && addr->srose_ndigis > 1)
+	}
+	if (addr_len == sizeof(struct sockaddr_rose) && addr->srose_ndigis > 1) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if ((unsigned int) addr->srose_ndigis > ROSE_MAX_DIGIS)
+	}
+	if ((unsigned int) addr->srose_ndigis > ROSE_MAX_DIGIS) {
+		release_sock(sk);
 		return -EINVAL;
-
-	if ((dev = rose_dev_get(&addr->srose_addr)) == NULL)
+	}
+	if ((dev = rose_dev_get(&addr->srose_addr)) == NULL) {
+		release_sock(sk);
 		return -EADDRNOTAVAIL;
+	}
 
 	source = &addr->srose_call;
 
@@ -687,8 +695,11 @@ static int rose_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 		rose->source_call = user->call;
 		ax25_uid_put(user);
 	} else {
-		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE))
+		if (ax25_uid_policy && !capable(CAP_NET_BIND_SERVICE)) {
+			release_sock(sk);
+			dev_put(dev);
 			return -EACCES;
+		}
 		rose->source_call   = *source;
 	}
 
@@ -709,6 +720,8 @@ static int rose_bind(struct socket *sock, struct sockaddr *uaddr, int addr_len)
 	rose_insert_socket(sk);
 
 	sock_reset_flag(sk, SOCK_ZAPPED);
+	dev_put(dev);
+	release_sock(sk);
 
 	return 0;
 }
@@ -785,6 +798,7 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 
 		user = ax25_findbyuid(current_euid());
 		if (!user) {
+			dev_put(dev);
 			err = -EINVAL;
 			goto out_release;
 		}
@@ -794,6 +808,7 @@ static int rose_connect(struct socket *sock, struct sockaddr *uaddr, int addr_le
 		rose->device      = dev;
 		ax25_uid_put(user);
 
+		dev_put(dev);
 		rose_insert_socket(sk);		/* Finish the bind */
 	}
 	rose->dest_addr   = addr->srose_addr;
@@ -1607,22 +1622,22 @@ static void __exit rose_exit(void)
 
 	rose_rt_free();
 
-	ax25_protocol_release(AX25_P_ROSE);
-	ax25_linkfail_release(&rose_linkfail_notifier);
-
 	if (ax25cmp(&rose_callsign, &null_ax25_address) != 0)
 		ax25_listen_release(&rose_callsign, NULL);
 
 #ifdef CONFIG_SYSCTL
 	rose_unregister_sysctl();
 #endif
+
+	ax25_linkfail_release(&rose_linkfail_notifier);
+	ax25_protocol_release(AX25_P_ROSE);
+
 	unregister_netdevice_notifier(&rose_dev_notifier);
 
 	sock_unregister(PF_ROSE);
 
 	for (i = 0; i < rose_ndevs; i++) {
 		struct net_device *dev = dev_rose[i];
-
 		if (dev) {
 			unregister_netdev(dev);
 			free_netdev(dev);
@@ -1632,5 +1647,4 @@ static void __exit rose_exit(void)
 	kfree(dev_rose);
 	proto_unregister(&rose_proto);
 }
-
 module_exit(rose_exit);
diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 3444562..ea48cee 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -102,6 +102,7 @@ static void rose_loopback_timer(unsigned long param)
 			if ((dev = rose_dev_get(dest)) != NULL) {
 				if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 					kfree_skb(skb);
+				dev_put(dev);
 			} else {
 				kfree_skb(skb);
 			}
diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 40148932..46505317 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -599,6 +599,7 @@ static struct net_device *rose_ax25_dev_find(char *devname)
 	if ((dev->flags & IFF_UP) && dev->type == ARPHRD_AX25)
 		return dev;
 
+	dev_put(dev);
 	return NULL;
 }
 
@@ -615,6 +616,8 @@ struct net_device *rose_dev_first(void)
 			if (first == NULL || strncmp(dev->name, first->name, 3) < 0)
 				first = dev;
 	}
+	if (first)
+		dev_hold(first);
 	rcu_read_unlock();
 
 	return first;
@@ -742,6 +745,7 @@ int rose_rt_ioctl(unsigned int cmd, void __user *arg)
 		if (rose_route.ndigis > AX25_MAX_DIGIS)
 			return -EINVAL;
 		err = rose_add_node(&rose_route, dev);
+		dev_put(dev);
 		return err;
 
 	case SIOCDELRT:
@@ -750,6 +754,7 @@ int rose_rt_ioctl(unsigned int cmd, void __user *arg)
 		if ((dev = rose_ax25_dev_find(rose_route.device)) == NULL)
 			return -EINVAL;
 		err = rose_del_node(&rose_route, dev);
+		dev_put(dev);
 		return err;
 
 	case SIOCRSCLRRT:
---------------------------------------------------------------------

-- 
Regards
	Richard
