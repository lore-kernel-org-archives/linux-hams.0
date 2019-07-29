From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] net: hamradio: baycom_epp: Mark expected switch fall-through
Date: Mon, 29 Jul 2019 15:12:31 -0500
Message-ID: <20190729201231.GA7576@embeddedor>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=oENqlPZb6frT+9DV38Oo3+KZ9Fe2eujoFK1IJWgO4vw=; b=bvchi7hMrWhQPxGx54HWPe1FFE
        9Q7FdSp3dSqUxWMZ+3xyYnsciVZgTrxHcDFC371vq/52zy+/8aD/Hz/ggxNEn2bwxK3flx8V3/g2g
        l7sfwySfRiFiZq9P3gVtkvj/emQCy/xz3ccUV2c999hwW9IqmPuVRsCn/LXhRnjBiKzTI28sAKyHf
        lE9nn1YYGg3ji/WXTmN+J7XAE6mIimvc6ZhHwqMzGiwyTiNWol3A4FK13CZFKKY3ZMilxo3uITFrW
        rY27zgrimQSiK5JbrN+igpeqSesCY2ah3B+6RZf0HhxA3la4QRsbCyutGKebvwisgI03eU+eO+ByX
        5Ufd 
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Thomas Sailer <t.sailer@alumni.ethz.ch>, "David S. Miller" <davem@davemloft.net>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: i386):

drivers/net/hamradio/baycom_epp.c: In function ‘transmit’:
drivers/net/hamradio/baycom_epp.c:491:7: warning: this statement may fall through [-Wimplicit-fallthrough=]
    if (i) {
       ^
drivers/net/hamradio/baycom_epp.c:504:3: note: here
   default:  /* fall through */
   ^~~~~~~

Notice that, in this particular case, the code comment is
modified in accordance with what GCC is expecting to find.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/net/hamradio/baycom_epp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index daab2c07d891..9303aeb2595f 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -500,8 +500,9 @@ static int transmit(struct baycom_state *bc, int cnt, unsigned char stat)
 				}
 				break;
 			}
+			/* fall through */
 
-		default:  /* fall through */
+		default:
 			if (bc->hdlctx.calibrate <= 0)
 				return 0;
 			i = min_t(int, cnt, bc->hdlctx.calibrate);
-- 
2.22.0

