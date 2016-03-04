From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: [PATCH net 3/3] ax25: add link layer header validation function
Date: Fri,  4 Mar 2016 15:44:17 -0500
Message-ID: <1457124257-31486-4-git-send-email-willemdebruijn.kernel@gmail.com>
References: <1457124257-31486-1-git-send-email-willemdebruijn.kernel@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gi9gizdHMYvCzozNMysXq6rXtBt4/qQsWVE+iGSkjNw=;
        b=Afea8+gHx/I3ZwfOGb+7JIOM29wCkxLMqvq9dcCRHz6tW12NVmzWinAiA9zI9uha7n
         GA7g68hvQBIRpWkdbH21OdmR2KzpfAzYOM8GQCmOnOh0fpuno8+govME+RxRNFNKXdDk
         ZVTBNz5wI+zPtU/g8ltq6LCYIx3RQfq4m30n5hRnPtZza0BYj6/gMbww5PTf9omaS+nG
         og8ADYnuY5UXe1DfZexVf/CSoljs5m+T+BfFXnSCYlfSnJJQ+9f6Y5H/X1n4oSKVXmZt
         c8Ag7eOvsht77cAl1P6St8cVe/4YcRCvLEEJVKhydp2x2MhHGfHv83VjbSgnhE7wHVGA
         oBPQ==
In-Reply-To: <1457124257-31486-1-git-send-email-willemdebruijn.kernel@gmail.com>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: davem@davemloft.net, alan@linux.intel.com, hessu@hes.iki.fi, martin.blumenstingl@googlemail.com, linux-hams@vger.kernel.org, Willem de Bruijn <willemb@google.com>

From: Willem de Bruijn <willemb@google.com>

As variable length protocol, AX25 fails link layer header validation
tests based on a minimum length. header_ops.validate allows protocols
to validate headers that are shorter than hard_header_len. Implement
this callback for AX25.

Compile tested only.

See also http://comments.gmane.org/gmane.linux.network/401064

Signed-off-by: Willem de Bruijn <willemb@google.com>
---
 net/ax25/ax25_ip.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/ax25/ax25_ip.c b/net/ax25/ax25_ip.c
index b563a3f..77bc20d 100644
--- a/net/ax25/ax25_ip.c
+++ b/net/ax25/ax25_ip.c
@@ -228,8 +228,23 @@ netdev_tx_t ax25_ip_xmit(struct sk_buff *skb)
 }
 #endif
 
+static bool ax25_validate_header(const char *header, unsigned int len)
+{
+	ax25_digi digi;
+
+	if (!len)
+		return false;
+
+	if (header[0] != 0)
+		return true;
+
+	return ax25_addr_parse(header + 1, len - 1, NULL, NULL, &digi, NULL,
+			       NULL);
+}
+
 const struct header_ops ax25_header_ops = {
 	.create = ax25_hard_header,
+	.validate = ax25_validate_header,
 };
 
 EXPORT_SYMBOL(ax25_header_ops);
-- 
2.7.0.rc3.207.g0ac5344

