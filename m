From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 08/17] baycom_epp: Replace rdtscl() with native_read_tsc()
Date: Fri, 12 Jun 2015 16:41:42 -0700
Message-ID: <1195ce0c7f34169ff3006341b77806184a46b9bf.1434152192.git.luto@kernel.org>
References: <cover.1434152192.git.luto@kernel.org>
Return-path: <linux-hams-owner@vger.kernel.org>
In-Reply-To: <cover.1434152192.git.luto@kernel.org>
In-Reply-To: <cover.1434152192.git.luto@kernel.org>
References: <cover.1434152192.git.luto@kernel.org>
Sender: linux-hams-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org
Cc: Borislav Petkov <bp@suse.de>, Peter Zijlstra <peterz@infradead.org>, John Stultz <john.stultz@linaro.org>, linux-kernel@vger.kernel.org, Len Brown <lenb@kernel.org>, Huang Rui <ray.huang@amd.com>, Denys Vlasenko <dvlasenk@redhat.com>, Andy Lutomirski <luto@kernel.org>, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-hams@vger.kernel.org

This is only used if BAYCOM_DEBUG is defined.

Cc: Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: linux-hams@vger.kernel.org
Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/net/hamradio/baycom_epp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 83c7cce0d172..44e5c3b5e0af 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -638,7 +638,7 @@ static int receive(struct net_device *dev, int cnt)
 #define GETTICK(x)                                                \
 ({                                                                \
 	if (cpu_has_tsc)                                          \
-		rdtscl(x);                                        \
+		x = (unsigned int)native_read_tsc();		  \
 })
 #else /* __i386__ */
 #define GETTICK(x)
-- 
2.4.2

