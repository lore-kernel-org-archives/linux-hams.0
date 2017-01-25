From: Sowmini Varadhan <sowmini.varadhan@oracle.com>
Subject: AX25: help with testing/review of an ax25 patch
Date: Wed, 25 Jan 2017 16:20:44 -0500
Message-ID: <20170125212044.GE24934@oracle.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ralf@linux-mips.org, linux-hams@vger.kernel.org
Cc: davem@davemloft.net


Ralf, linux-hams,

The patch below is a consequence of the review comments
for the RFC patch at
  http://patchwork.ozlabs.org/patch/719236/

which was itself a result of the disucssion at
  https://www.spinics.net/lists/netdev/msg415870.html

According to cscope, the only in-kernel driver that provides
a non-null ->validate is AX25, and I've made an attempt
to get this to return the size of the validated header
by code-inspection. However, I dont have the means or 
expertise to test this, so I could use your testing/review
help. Can you please take a look? 

thanks in advance
--Sowmini

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 3868c32..d233ec8 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -271,7 +271,7 @@ struct header_ops {
 	void	(*cache_update)(struct hh_cache *hh,
 				const struct net_device *dev,
 				const unsigned char *haddr);
-	bool	(*validate)(const char *ll_header, unsigned int len);
+	int	(*validate)(const char *ll_header, unsigned int len);
 };
 
 /* These flag bits are private to the generic network queueing
@@ -2685,21 +2685,21 @@ static inline int dev_parse_header(const struct sk_buff *skb,
 }
 
 /* ll_header must have at least hard_header_len allocated */
-static inline bool dev_validate_header(const struct net_device *dev,
+static inline int dev_validate_header(const struct net_device *dev,
 				       char *ll_header, int len)
 {
 	if (likely(len >= dev->hard_header_len))
-		return true;
+		return len;
 
 	if (capable(CAP_SYS_RAWIO)) {
 		memset(ll_header + len, 0, dev->hard_header_len - len);
-		return true;
+		return dev->hard_header_len;
 	}
 
 	if (dev->header_ops && dev->header_ops->validate)
 		return dev->header_ops->validate(ll_header, len);
 
-	return false;
+	return dev->hard_header_len;
 }
 
 typedef int gifconf_func_t(struct net_device * dev, char __user * bufptr, int len);
diff --git a/net/ax25/ax25_ip.c b/net/ax25/ax25_ip.c
index 183b1c5..7a1c296 100644
--- a/net/ax25/ax25_ip.c
+++ b/net/ax25/ax25_ip.c
@@ -228,18 +228,23 @@ netdev_tx_t ax25_ip_xmit(struct sk_buff *skb)
 }
 #endif
 
-static bool ax25_validate_header(const char *header, unsigned int len)
+static int ax25_validate_header(const char *header, unsigned int len)
 {
 	ax25_digi digi;
+	const unsigned char *data;
 
 	if (!len)
-		return false;
+		return -EINVAL;
 
 	if (header[0])
-		return true;
+		return len;
 
-	return ax25_addr_parse(header + 1, len - 1, NULL, NULL, &digi, NULL,
+	data = ax25_addr_parse(header + 1, len - 1, NULL, NULL, &digi, NULL,
 			       NULL);
+	if (!data)
+		return -EINVAL;
+
+	return (data - (const unsigned char *)header);
 }
 
 const struct header_ops ax25_header_ops = {
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index ddbda25..7af09a3 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1845,6 +1845,7 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 	__be16 proto = 0;
 	int err;
 	int extra_len = 0;
+	int newlen;
 
 	/*
 	 *	Get and verify the address.
@@ -1920,7 +1921,11 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto retry;
 	}
 
-	if (!dev_validate_header(dev, skb->data, len)) {
+	newlen = dev_validate_header(dev, skb->data, len);
+	/* As comments above this function indicate, a full L2 header
+	 * must be passed to this function, so if newlen > len, bail.
+	 */
+	if (newlen < 0 || newlen > len) {
 		err = -EINVAL;
 		goto out_unlock;
 	}
@@ -2447,14 +2452,21 @@ static int tpacket_fill_skb(struct packet_sock *po, struct sk_buff *skb,
 			return -EINVAL;
 	} else if (copylen) {
 		int hdrlen = min_t(int, copylen, tp_len);
+		int newlen;
 
 		skb_push(skb, dev->hard_header_len);
 		skb_put(skb, copylen - dev->hard_header_len);
 		err = skb_store_bits(skb, 0, data, hdrlen);
 		if (unlikely(err))
 			return err;
-		if (!dev_validate_header(dev, skb->data, hdrlen))
+		newlen = dev_validate_header(dev, skb->data, hdrlen);
+		if (newlen < 0)
 			return -EINVAL;
+		/* Caller has allocated for copylen in non-paged part of
+		 * skb so we should never find newlen > hdrlen
+		 */
+		WARN_ON(newlen > hdrlen);
+
 		if (!skb->protocol)
 			tpacket_set_protocol(dev, skb);
 
@@ -2857,10 +2869,13 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	if (err)
 		goto out_free;
 
-	if (sock->type == SOCK_RAW &&
-	    !dev_validate_header(dev, skb->data, len)) {
-		err = -EINVAL;
-		goto out_free;
+	if (sock->type == SOCK_RAW) {
+		int newlen = dev_validate_header(dev, skb->data, len);
+
+		if (newlen < 0 || newlen > len) {
+			err = -EINVAL;
+			goto out_free;
+		}
 	}
 
 	sock_tx_timestamp(sk, sockc.tsflags, &skb_shinfo(skb)->tx_flags);




