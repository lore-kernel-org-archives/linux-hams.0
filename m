From: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] net: ax25: Fix error path of ax25_init()
Date: Sat, 31 Jul 2021 07:27:32 +0000
Message-ID: <20210731072732.103631-1-zhengyongjun3@huawei.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This patch add error path for ax25_init() to avoid possible crash if some
error occurs.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 net/ax25/af_ax25.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 2631efc..4edc322 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1977,17 +1977,32 @@ static int __init ax25_init(void)
 {
 	int rc = proto_register(&ax25_proto, 0);
 
-	if (rc != 0)
+	if (rc)
 		goto out;
 
-	sock_register(&ax25_family_ops);
-	dev_add_pack(&ax25_packet_type);
-	register_netdevice_notifier(&ax25_dev_notifier);
+	rc = sock_register(&ax25_family_ops);
+	if (rc)
+		goto out_proto;
+	rc = dev_add_pack(&ax25_packet_type);
+	if (rc)
+		goto out_sock;
+	rc = register_netdevice_notifier(&ax25_dev_notifier);
+	if (rc)
+		goto out_dev;
 
 	proc_create_seq("ax25_route", 0444, init_net.proc_net, &ax25_rt_seqops);
 	proc_create_seq("ax25", 0444, init_net.proc_net, &ax25_info_seqops);
 	proc_create_seq("ax25_calls", 0444, init_net.proc_net,
 			&ax25_uid_seqops);
+
+	return 0;
+
+out_dev:
+	dev_remove_pack(&ax25_packet_type);
+out_sock:
+	sock_unregister(PF_AX25);
+out_proto:
+	proto_unregister(&ax25_proto);
 out:
 	return rc;
 }
-- 
2.9.4

