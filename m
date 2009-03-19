From: bernard pidoux <f6bvp@free.fr>
Subject: [PATCH 2/3] [AX25] zero length frame filtering in AX25
Date: Thu, 19 Mar 2009 19:16:51 +0100
Message-ID: <1237486611.30285.16.camel@f6bvp-11>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-hams-owner@vger.kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-hams@vger.kernel.org

In previous commit 244f46ae6e9e18f6fc0be7d1f49febde4762c34b
was introduced a zero length frame filter for ROSE protocole.
This patch has the same purpose at AX25 frame level for the same
reason. Empty frames have no meaning in AX25 protocole.

Signed-off-by: Bernard Pidoux <f6bvp@amsat.org>
---
 net/ax25/af_ax25.c |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 532a031..ca32f57 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1435,6 +1435,11 @@ static int ax25_sendmsg(struct kiocb *iocb, struct socket *sock,
 	size_t size;
 	int lv, err, addr_len = msg->msg_namelen;
 
+	/* AX.25 empty data frame has no meaning : don't send */
+	if (len == 0) {
+		return (0);
+	}
+
 	if (msg->msg_flags & ~(MSG_DONTWAIT|MSG_EOR|MSG_CMSG_COMPAT))
 		return -EINVAL;
 
@@ -1634,6 +1639,13 @@ static int ax25_recvmsg(struct kiocb *iocb, struct socket *sock,
 	skb_reset_transport_header(skb);
 	copied = skb->len;
 
+	/* AX.25 empty data frame has no meaning : ignore it */
+	if (copied == 0) {
+		err = copied;
+		skb_free_datagram(sk, skb);
+		goto out;
+	}
+
 	if (copied > size) {
 		copied = size;
 		msg->msg_flags |= MSG_TRUNC;
-- 
1.6.0.6

