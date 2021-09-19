From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2 2/6] AX.25: Print decoded addresses rather than hex
 numbers.
Date: Sun, 19 Sep 2021 15:30:26 +0200
Message-ID: <d3d37a741284abfde960cc54411fda09e639fd47.1632059758.git.ralf@linux-mips.org>
References: <cover.1632059758.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1632059758.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

Before this, ip would have printed the AX.25 address configured for an
AX.25 interface's default addresses as:

  link/ax25 98:92:9c:aa:b0:40:02 brd a2:a6:a8:40:40:40:00

which is pretty unreadable.  With this commit ip will decode AX.25
addresses like

  link/ax25 LINUX-1 brd QST-0

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 lib/ll_addr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/ll_addr.c b/lib/ll_addr.c
index 00b562ae..910e6daf 100644
--- a/lib/ll_addr.c
+++ b/lib/ll_addr.c
@@ -39,6 +39,8 @@ const char *ll_addr_n2a(const unsigned char *addr, int alen, int type,
 
 	if (alen == 16 && (type == ARPHRD_TUNNEL6 || type == ARPHRD_IP6GRE))
 		return inet_ntop(AF_INET6, addr, buf, blen);
+	if (alen == 7 && type == ARPHRD_AX25)
+		return ax25_ntop(AF_AX25, addr, buf, blen);
 
 	snprintf(buf, blen, "%02x", addr[0]);
 	for (i = 1, l = 2; i < alen && l < blen; i++, l += 3)
-- 
2.31.1


