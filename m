From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] ax25: Fix use of copy_from_sockptr() in ax25_setsockopt()
Date: Thu, 30 Sep 2021 18:24:35 +0200
Message-ID: <YVXkwzKZhPoD0Ods@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Christoph Hellwig <hch@lst.de>, Thomas Osterried <thomas@osterried.de>, linux-hams@vger.kernel.org

The destination pointer passed to copy_from_sockptr() is an unsigned long *
but the source in userspace is an unsigned int * resulting in an integer
of the wrong size being copied from userspace.

This happens to work on 32 bit but breaks 64-bit where bytes 4..7 will not
be initialized.  By luck it may work on little endian but on big endian
where the userspace data is copied to the upper 32 bit of the destination
it's most likely going to break.

A simple test case to demonstrate this setsockopt() issue is:

[...]
        int sk = socket(AF_AX25, SOCK_SEQPACKET, 0);
        int n1 = 42;
        int res = setsockopt(sk, SOL_AX25, AX25_T1, &n1, sizeof(n1));
        printf("res = %d\n", res);
[...]

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Cc: stable@vger.kernel.org # 5.9
Fixes: a7b75c5a8c41 ("net: pass a sockptr_t into ->setsockopt")
---
 net/ax25/af_ax25.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 2631efc6e359..9f2e4b76394a 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -534,7 +534,7 @@ static int ax25_setsockopt(struct socket *sock, int level, int optname,
 	ax25_cb *ax25;
 	struct net_device *dev;
 	char devname[IFNAMSIZ];
-	unsigned long opt;
+	unsigned int opt;
 	int res = 0;
 
 	if (level != SOL_AX25)
