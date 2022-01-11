From: Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH net] ax25: use after free in ax25_connect
Date: Tue, 11 Jan 2022 12:20:48 +0800
Message-ID: <20220111042048.43532-1-hbh25y@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UvMY/BpPHYLYCpXHLFkn3wGD0r030IMs3mS/Z9JjkxE=;
        b=B4huMDPf/I5XDFsWvuSzqemyC/KmP1kbRmHZg++C6oVqbp5JbmVAzQgwpvPHI2R75a
         eFndp8C17Wl5PflRaDCVZxWcEbqa5+6UBaNvURPDfheA6K3ribm3QBuU6IOQsF33gvfv
         CjqRwLCo8SxPYN+3PU9wnp1g8XQZT7e3InZz01HdorpXlY2u1ZmABwxOTI3afAnpZwat
         i9vhYGqNVJ8YqfUT5BX0bjwabLXthH/pG1n69kGxdrzJ/ttwuvaMK9HnkU1t1NJ+JTqA
         QeE/kZSdavrTfUBIMdC4YD/raQ0rjw+M3FbXDOLoz/5nwzR2M6KdOEqNP0tSb1lZ4ktK
         ruYA==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jreuter@yaina.de, ralf@linux-mips.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Hangyu Hua <hbh25y@gmail.com>

sk_to_ax25(sk) needs to be called after lock_sock(sk) to avoid UAF
caused by a race condition.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 net/ax25/af_ax25.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index cfca99e295b8..c5d62420a2a8 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -1127,7 +1127,7 @@ static int __must_check ax25_connect(struct socket *sock,
 	struct sockaddr *uaddr, int addr_len, int flags)
 {
 	struct sock *sk = sock->sk;
-	ax25_cb *ax25 = sk_to_ax25(sk), *ax25t;
+	ax25_cb *ax25, *ax25t;
 	struct full_sockaddr_ax25 *fsa = (struct full_sockaddr_ax25 *)uaddr;
 	ax25_digi *digi = NULL;
 	int ct = 0, err = 0;
@@ -1155,6 +1155,8 @@ static int __must_check ax25_connect(struct socket *sock,
 
 	lock_sock(sk);
 
+	ax25 = sk_to_ax25(sk);
+
 	/* deal with restarts */
 	if (sock->state == SS_CONNECTING) {
 		switch (sk->sk_state) {
-- 
2.25.1

