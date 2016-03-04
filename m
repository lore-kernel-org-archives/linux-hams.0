From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: [PATCH net 2/3] packet: validate variable length ll headers
Date: Fri,  4 Mar 2016 15:44:16 -0500
Message-ID: <1457124257-31486-3-git-send-email-willemdebruijn.kernel@gmail.com>
References: <1457124257-31486-1-git-send-email-willemdebruijn.kernel@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vp/xLtmhcEI7BjMoOrOR7gg/POyQ81nl0rIUfesJb+w=;
        b=DEvDKMkgZ0qI/yXEVg5rY2LJxuXiO6LRFtuciP5rKzUMVuD/r72GkII7UpfySYREfH
         BJOTVmGDZjnJFM8GxJBlutJL7Kxf4UFZhICA3Y8BZnJDO+Tde4Hqe+2uCB/k8FqsBZ0H
         ORYz1k/y0wSjRQVPY6wuqdMmMYdVHNjS3Tc+ly1CAgj3t5Pk6dm/22XAjWYngsvhiQM0
         PgLmyjiCjtoX/YyDozROiVZi7cO5C+N7gGIXBAEiTp5blcXvbFEKAmlwaDQ1SMSkCk4Y
         xE8f5SV/4kD3keAoRTpsjL3yiS8CLA7anyE7zDHBygIADlGYRM0WDlyMLOKssv3uMWba
         DeWg==
In-Reply-To: <1457124257-31486-1-git-send-email-willemdebruijn.kernel@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, alan@linux.intel.com, hessu@hes.iki.fi, martin.blumenstingl@googlemail.com, linux-hams@vger.kernel.org, Willem de Bruijn <willemb@google.com>

From: Willem de Bruijn <willemb@google.com>

Replace link layer header validation check ll_header_truncate with
more generic dev_validate_header.

Validation based on hard_header_len incorrectly drops valid packets
in variable length protocols, such as AX25. dev_validate_header
calls header_ops.validate for such protocols to ensure correctness
below hard_header_len.

See also http://comments.gmane.org/gmane.linux.network/401064

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/packet/af_packet.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 992396a..488678a 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -1916,6 +1916,10 @@ retry:
 		goto retry;
 	}
 
+	if (!dev_validate_header(dev, skb->data, len)) {
+		err = -EINVAL;
+		goto out_unlock;
+	}
 	if (len > (dev->mtu + dev->hard_header_len + extra_len) &&
 	    !packet_extra_vlan_len_allowed(dev, skb)) {
 		err = -EMSGSIZE;
@@ -2326,18 +2330,6 @@ static void tpacket_destruct_skb(struct sk_buff *skb)
 	sock_wfree(skb);
 }
 
-static bool ll_header_truncated(const struct net_device *dev, int len)
-{
-	/* net device doesn't like empty head */
-	if (unlikely(len < dev->hard_header_len)) {
-		net_warn_ratelimited("%s: packet size is too short (%d < %d)\n",
-				     current->comm, len, dev->hard_header_len);
-		return true;
-	}
-
-	return false;
-}
-
 static void tpacket_set_protocol(const struct net_device *dev,
 				 struct sk_buff *skb)
 {
@@ -2420,14 +2412,14 @@ static int tpacket_fill_skb(struct packet_sock *po, struct sk_buff *skb,
 		if (unlikely(err < 0))
 			return -EINVAL;
 	} else if (dev->hard_header_len) {
-		if (ll_header_truncated(dev, tp_len))
-			return -EINVAL;
+		int hhlen = min_t(int, dev->hard_header_len, tp_len);
 
 		skb_push(skb, dev->hard_header_len);
-		err = skb_store_bits(skb, 0, data,
-				dev->hard_header_len);
+		err = skb_store_bits(skb, 0, data, hhlen);
 		if (unlikely(err))
 			return err;
+		if (!dev_validate_header(dev, skb->data, hhlen))
+			return -EINVAL;
 		if (!skb->protocol)
 			tpacket_set_protocol(dev, skb);
 
@@ -2758,14 +2750,12 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 
 	skb_set_network_header(skb, reserve);
 
-	err = -EINVAL;
 	if (sock->type == SOCK_DGRAM) {
 		offset = dev_hard_header(skb, dev, ntohs(proto), addr, NULL, len);
-		if (unlikely(offset < 0))
-			goto out_free;
-	} else {
-		if (ll_header_truncated(dev, len))
+		if (unlikely(offset < 0)) {
+			err = -EINVAL;
 			goto out_free;
+		}
 	}
 
 	/* Returns -EFAULT on error */
@@ -2773,6 +2763,12 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 	if (err)
 		goto out_free;
 
+	if (sock->type == SOCK_RAW &&
+	    !dev_validate_header(dev, skb->data, len)) {
+		err = -EINVAL;
+		goto out_free;
+	}
+
 	sock_tx_timestamp(sk, &skb_shinfo(skb)->tx_flags);
 
 	if (!gso_type && (len > dev->mtu + reserve + extra_len) &&
-- 
2.7.0.rc3.207.g0ac5344

