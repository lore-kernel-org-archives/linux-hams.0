From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH v2 1/6] AX.25: Add ax25_ntop implementation.
Date: Sun, 19 Sep 2021 15:30:26 +0200
Message-ID: <354e26b327e861129b66e414faa7cc9f34524109.1632059758.git.ralf@linux-mips.org>
References: <cover.1632059758.git.ralf@linux-mips.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1632059758.git.ralf@linux-mips.org>
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, linux-hams@vger.kernel.org

AX.25 addresses are based on Amateur radio callsigns followed by an SSID
like XXXXXX-SS where the callsign is up to 6 characters which are either
letters or digits and the SSID is a decimal number in the range 0..15.
Amateur radio callsigns are assigned by a country's relevant authorities
and are 3..6 characters though a few countries have assigned callsigns
longer than that.  AX.25 is not able to handle such longer callsigns.

Being based on HDLC AX.25 encodes addresses by shifting them one bit left
thus zeroing bit 0, the HDLC extension bit for all but the last bit of
a packet's address field but for our purposes here we're not considering
the HDLC extension bit that is it will always be zero.

Linux' internal representation of AX.25 addresses in Linux is very similar
to this on the on-air or on-the-wire format.  The callsign is padded to
6 octets by adding spaces, followed by the SSID octet then all 7 octets
are left-shifted by one byte.

This for example turns "LINUX-1" where the callsign is LINUX and SSID is 1
into 98:92:9c:aa:b0:40:02.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 Makefile        |  3 ++
 include/utils.h |  2 ++
 lib/ax25_ntop.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 lib/ax25_ntop.c

diff --git a/Makefile b/Makefile
index 5bc11477..551f528b 100644
--- a/Makefile
+++ b/Makefile
@@ -40,6 +40,9 @@ DEFINES+=-DCONFDIR=\"$(CONFDIR)\" \
          -DNETNS_RUN_DIR=\"$(NETNS_RUN_DIR)\" \
          -DNETNS_ETC_DIR=\"$(NETNS_ETC_DIR)\"
 
+#options for AX.25
+ADDLIB+=ax25_ntop.o
+
 #options for mpls
 ADDLIB+=mpls_ntop.o mpls_pton.o
 
diff --git a/include/utils.h b/include/utils.h
index c9849461..947ab5c3 100644
--- a/include/utils.h
+++ b/include/utils.h
@@ -198,6 +198,8 @@ bool matches(const char *prefix, const char *string);
 int inet_addr_match(const inet_prefix *a, const inet_prefix *b, int bits);
 int inet_addr_match_rta(const inet_prefix *m, const struct rtattr *rta);
 
+const char *ax25_ntop(int af, const void *addr, char *str, socklen_t len);
+
 const char *mpls_ntop(int af, const void *addr, char *str, size_t len);
 int mpls_pton(int af, const char *src, void *addr, size_t alen);
 
diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
new file mode 100644
index 00000000..48098581
--- /dev/null
+++ b/lib/ax25_ntop.c
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <errno.h>
+#include <sys/socket.h>
+#include <netax25/ax25.h>
+
+#include "utils.h"
+
+/*
+ * AX.25 addresses are based on Amateur radio callsigns followed by an SSID
+ * like XXXXXX-SS where the callsign is up to 6 characters which are either
+ * letters or digits and the SSID is a decimal number in the range 0..15.
+ * Amateur radio callsigns are assigned by a country's relevant authorities
+ * and are 3..6 characters though a few countries have assigned callsigns
+ * longer than that.  AX.25 is not able to handle such longer callsigns.
+ *
+ * Being based on HDLC AX.25 encodes addresses by shifting them one bit left
+ * thus zeroing bit 0, the HDLC extension bit for all but the last bit of
+ * a packet's address field but for our purposes here we're not considering
+ * the HDLC extension bit that is it will always be zero.
+ *
+ * Linux' internal representation of AX.25 addresses in Linux is very similar
+ * to this on the on-air or on-the-wire format.  The callsign is padded to
+ * 6 octets by adding spaces, followed by the SSID octet then all 7 octets
+ * are left-shifted by one byte.
+ *
+ * This for example turns "LINUX-1" where the callsign is LINUX and SSID is 1
+ * into 98:92:9c:aa:b0:40:02.
+ */
+
+static const char *ax25_ntop1(const ax25_address *src, char *dst,
+			      socklen_t size)
+{
+	char c, *s;
+	int n;
+
+	for (n = 0, s = dst; n < 6; n++) {
+		c = (src->ax25_call[n] >> 1) & 0x7f;
+		if (c != ' ')
+			*s++ = c;
+	}
+
+	*s++ = '-';
+
+	n = ((src->ax25_call[6] >> 1) & 0x0f);
+	if (n > 9) {
+		*s++ = '1';
+		n -= 10;
+	}
+
+	*s++ = n + '0';
+	*s++ = '\0';
+
+	if (*dst == '\0' || *dst == '-') {
+		dst[0] = '*';
+		dst[1] = '\0';
+	}
+
+	return dst;
+}
+
+const char *ax25_ntop(int af, const void *addr, char *buf, socklen_t buflen)
+{
+	switch (af) {
+	case AF_AX25:
+		errno = 0;
+		return ax25_ntop1((ax25_address *)addr, buf, buflen);
+
+	default:
+		errno = EAFNOSUPPORT;
+	}
+
+	return NULL;
+}
-- 
2.31.1


