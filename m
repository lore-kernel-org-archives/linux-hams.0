From: Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH] hamradio: Fix wrong assignment of 'bbc->cfg.loopback'
Date: Tue, 15 Mar 2022 15:48:51 +0800
Message-ID: <20220315074851.6456-1-tangmeng@uniontech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: t.sailer@alumni.ethz.ch, davem@davemloft.net, kuba@kernel.org
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Meng Tang <tangmeng@uniontech.com>

In file hamradio/baycom_epp.c, the baycom_setmode interface, there
is a problem with improper use of strstr.

Suppose that when modestr="noloopback", both conditions which are
'strstr(modestr,"noloopback")' and 'strstr(modestr,"loopback")'
will be true(not NULL), this lead the bc->cfg.loopback variable
will be first assigned to 0, and then reassigned to 1.

This will cause 'bc->cfg.loopback = 0' will never take effect. That
obviously violates the logic of the code, so adjust the order of
their execution to solve the problem.

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 drivers/net/hamradio/baycom_epp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index a03d0b474641..36e6de42ae77 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -982,10 +982,10 @@ static int baycom_setmode(struct baycom_state *bc, const char *modestr)
 		bc->cfg.extmodem = 0;
 	if (strstr(modestr,"extmodem"))
 		bc->cfg.extmodem = 1;
-	if (strstr(modestr,"noloopback"))
-		bc->cfg.loopback = 0;
 	if (strstr(modestr,"loopback"))
 		bc->cfg.loopback = 1;
+	if (strstr(modestr, "noloopback"))
+		bc->cfg.loopback = 0;
 	if ((cp = strstr(modestr,"fclk="))) {
 		bc->cfg.fclk = simple_strtoul(cp+5, NULL, 0);
 		if (bc->cfg.fclk < 1000000)
-- 
2.20.1



