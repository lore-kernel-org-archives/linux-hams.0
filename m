From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2 4/6] NETROM: Print decoded addresses rather than hex
 numbers.
Date: Sun, 19 Sep 2021 15:30:26 +0200
Message-ID: <140fac95627e5a66f9482b6ce550173cef61bab3.1632059758.git.ralf@linux-mips.org>
References: <cover.1632059758.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1632059758.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

NETROM is an OSI layer 3 protocol sitting on top of AX.25.  It also uses
AX.25 addresses.  Without this commit ip will print NETROM address like

  link/generic 98:92:9c:aa:b0:40:02 brd 00:00:00:00:00:00:00

while with this commit the decoded result

  link/generic LINUX-1 brd *

is much more eye friendly.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 lib/ll_addr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/ll_addr.c b/lib/ll_addr.c
index 910e6daf..46e30c79 100644
--- a/lib/ll_addr.c
+++ b/lib/ll_addr.c
@@ -41,6 +41,8 @@ const char *ll_addr_n2a(const unsigned char *addr, int alen, int type,
 		return inet_ntop(AF_INET6, addr, buf, blen);
 	if (alen == 7 && type == ARPHRD_AX25)
 		return ax25_ntop(AF_AX25, addr, buf, blen);
+	if (alen == 7 && type == ARPHRD_NETROM)
+		return netrom_ntop(AF_NETROM, addr, buf, blen);
 
 	snprintf(buf, blen, "%02x", addr[0]);
 	for (i = 1, l = 2; i < alen && l < blen; i++, l += 3)
-- 
2.31.1


