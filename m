From: ebiederm@xmission.com (Eric W. Biederman)
Subject: [PATCH net-next 02/15] rose: Set the destination address in rose_header
Date: Mon, 02 Mar 2015 00:01:30 -0600
Message-ID: <877fv09but.fsf_-_@x220.int.ebiederm.org>
References: <87pp8xx6ik.fsf@x220.int.ebiederm.org>
	<20150227.162131.431559184124647735.davem@davemloft.net>
	<87mw3yg8da.fsf@x220.int.ebiederm.org>
	<20150301.230306.2023670900391030920.davem@davemloft.net>
	<871tl8dlxn.fsf@x220.int.ebiederm.org>
	<87lhjg9byo.fsf_-_@x220.int.ebiederm.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <87lhjg9byo.fsf_-_@x220.int.ebiederm.org> (Eric W. Biederman's
	message of "Sun, 01 Mar 2015 23:59:11 -0600")
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, linux-hams@vger.kernel.org


Not setting the destination address is a bug that I suspect causes no
problems today, as only the arp code seems to call dev_hard_header and
the description I have of rose is that it is expected to be used with a
static neigbour table.

I have derived the offset and the length of the rose destination address
from rose_rebuild_header where arp_find calls neigh_ha_snapshot to set
the destination address.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-hams@vger.kernel.org
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---
 net/rose/rose_dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/rose/rose_dev.c b/net/rose/rose_dev.c
index 50005888be57..24d2b40b6c6b 100644
--- a/net/rose/rose_dev.c
+++ b/net/rose/rose_dev.c
@@ -41,6 +41,9 @@ static int rose_header(struct sk_buff *skb, struct net_device *dev,
 {
 	unsigned char *buff = skb_push(skb, ROSE_MIN_LEN + 2);
 
+	if (daddr)
+		memcpy(buff + 7, daddr, dev->addr_len);
+
 	*buff++ = ROSE_GFI | ROSE_Q_BIT;
 	*buff++ = 0x00;
 	*buff++ = ROSE_DATA;
-- 
2.2.1
