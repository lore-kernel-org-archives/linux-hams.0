From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/8] hamradio: baycom: fix old-style declaration
Date: Thu, 16 Jun 2016 15:52:11 +0200
Message-ID: <20160616135245.3198419-4-arnd@arndb.de>
References: <20160616135020.3154461-1-arnd@arndb.de>
 <20160616135245.3198419-1-arnd@arndb.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20160616135245.3198419-1-arnd@arndb.de>
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Thomas Sailer <t.sailer@alumni.ethz.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org

Modern C standards expect the '__inline__' keyword to come before the return
type in a declaration, and we get a warning for this with "make W=1":

drivers/net/hamradio/baycom_par.c:159:1: error: '__inline__' is not at beginning of declaration [-Werror=old-style-declaration]

For consistency with other drivers, I'm changing '__inline__' to 'inline'
at the same time.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/hamradio/baycom_par.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/hamradio/baycom_par.c b/drivers/net/hamradio/baycom_par.c
index acb636963e90..072cddce9264 100644
--- a/drivers/net/hamradio/baycom_par.c
+++ b/drivers/net/hamradio/baycom_par.c
@@ -156,7 +156,7 @@ struct baycom_state {
 
 /* --------------------------------------------------------------------- */
 
-static void __inline__ baycom_int_freq(struct baycom_state *bc)
+static inline void baycom_int_freq(struct baycom_state *bc)
 {
 #ifdef BAYCOM_DEBUG
 	unsigned long cur_jiffies = jiffies;
@@ -192,7 +192,7 @@ static void __inline__ baycom_int_freq(struct baycom_state *bc)
 
 /* --------------------------------------------------------------------- */
 
-static __inline__ void par96_tx(struct net_device *dev, struct baycom_state *bc)
+static inline void par96_tx(struct net_device *dev, struct baycom_state *bc)
 {
 	int i;
 	unsigned int data = hdlcdrv_getbits(&bc->hdrv);
@@ -216,7 +216,7 @@ static __inline__ void par96_tx(struct net_device *dev, struct baycom_state *bc)
 
 /* --------------------------------------------------------------------- */
 
-static __inline__ void par96_rx(struct net_device *dev, struct baycom_state *bc)
+static inline void par96_rx(struct net_device *dev, struct baycom_state *bc)
 {
 	int i;
 	unsigned int data, mask, mask2, descx;
-- 
2.9.0

