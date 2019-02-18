From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] net: hamradio: remove unused hweight*() defines
Date: Mon, 18 Feb 2019 15:35:25 +0900
Message-ID: <1550471725-5575-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x1I6ZVhQ016992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1550471731;
        bh=KZ6waXrvZG9Xr56Nonejv6eOkhjv33RQzKN2a8rzlxw=;
        h=From:To:Cc:Subject:Date:From;
        b=riL2LQzeXheBTsDARRP9arKk/4Tc9VlRe7H8fU7qprD1WwxoykSRQWWXl8iXCvFKg
         kc74ghvevRHA53q9ncI6nh/BRUJ0LW7FaX9OuvkZNwvdUHJIV6FXBcCujv5tK6FaZo
         /ZF6faPdcyAPNPWb+FIyFQ+p5TW/N7toPwjHkHOdDw+hrU55rfdEMhLuxwm0Tb6WvS
         3rZ/4bd62utittOPwFrlC1yOaPjIxSU85+59dm6aCpPRN+Ifn7u9gDitwQgLvaPifz
         YOfN6/svjksjyHzoiWXtCIsAo53cW/kKjMIoUpwvideBgCEOInnGSihigTFU+TwEso
         CT+NG2B+LEF4g==
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-hams@vger.kernel.org, Thomas Sailer <t.sailer@alumni.ethz.ch>, linux-kernel@vger.kernel.org

This file does not use hweight*() at all, and the definition is
surrounded by #if 0 ... #endif.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/net/hamradio/baycom_ser_fdx.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/net/hamradio/baycom_ser_fdx.c b/drivers/net/hamradio/baycom_ser_fdx.c
index 190f66c..ed08416 100644
--- a/drivers/net/hamradio/baycom_ser_fdx.c
+++ b/drivers/net/hamradio/baycom_ser_fdx.c
@@ -203,32 +203,6 @@ static inline void ser12_set_divisor(struct net_device *dev,
          */
 }
 
-/* --------------------------------------------------------------------- */
-
-#if 0
-static inline unsigned int hweight16(unsigned int w)
-        __attribute__ ((unused));
-static inline unsigned int hweight8(unsigned int w)
-        __attribute__ ((unused));
-
-static inline unsigned int hweight16(unsigned int w)
-{
-        unsigned short res = (w & 0x5555) + ((w >> 1) & 0x5555);
-        res = (res & 0x3333) + ((res >> 2) & 0x3333);
-        res = (res & 0x0F0F) + ((res >> 4) & 0x0F0F);
-        return (res & 0x00FF) + ((res >> 8) & 0x00FF);
-}
-
-static inline unsigned int hweight8(unsigned int w)
-{
-        unsigned short res = (w & 0x55) + ((w >> 1) & 0x55);
-        res = (res & 0x33) + ((res >> 2) & 0x33);
-        return (res & 0x0F) + ((res >> 4) & 0x0F);
-}
-#endif
-
-/* --------------------------------------------------------------------- */
-
 static __inline__ void ser12_rx(struct net_device *dev, struct baycom_state *bc, struct timespec64 *ts, unsigned char curs)
 {
 	int timediff;
-- 
2.7.4

