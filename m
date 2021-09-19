From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2 6/6] ROSE: Print decoded addresses rather than hex numbers.
Date: Sun, 19 Sep 2021 15:30:26 +0200
Message-ID: <66f18d42c5b54b47110d323b62b2bca09f960282.1632059758.git.ralf@linux-mips.org>
References: <cover.1632059758.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1632059758.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

NETROM is a OSI layer 3 protocol sitting on top of AX.25.  It uses BCD-
encoded 10 digit telephone numbers as addresses.  Without this ip will
print a ROSE addresses like

  link/rose 12:34:56:78:90 brd 00:00:00:00:00

which is readable but ugly.  With this applied it ROSE addresses will be
printed as

  link/rose 1234567890 brd 0000000000

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 lib/ll_addr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/ll_addr.c b/lib/ll_addr.c
index 46e30c79..d6fd736b 100644
--- a/lib/ll_addr.c
+++ b/lib/ll_addr.c
@@ -43,6 +43,8 @@ const char *ll_addr_n2a(const unsigned char *addr, int alen, int type,
 		return ax25_ntop(AF_AX25, addr, buf, blen);
 	if (alen == 7 && type == ARPHRD_NETROM)
 		return netrom_ntop(AF_NETROM, addr, buf, blen);
+	if (alen == 5 && type == ARPHRD_ROSE)
+		return rose_ntop(AF_ROSE, addr, buf, blen);
 
 	snprintf(buf, blen, "%02x", addr[0]);
 	for (i = 1, l = 2; i < alen && l < blen; i++, l += 3)
-- 
2.31.1

