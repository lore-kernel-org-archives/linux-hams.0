From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 07/26] hamradio: baycom_epp: Fix return type of baycom_send_packet()
Date: Sun, 18 Dec 2022 11:19:57 -0500
Message-ID: <20221218162016.934280-7-sashal@kernel.org>
References: <20221218162016.934280-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671380435;
        bh=V4Wc+ag6ZBSxK/gsAMFtBzi+fvW7brfP0yj43Qrg0qQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LuGLDUVID8q8gjsAJUPjpul+WJ/34FWU6ViF9Sk4xzvliXSrQkLLdoc/hSDZMVmpm
         ZsQ7AL7NBUW7lfmIuNd+p5CPUOUoe8nfH6p6DjUTRG9HjFfG6OunwVvegXxV95/IU+
         sk/RrGyL+5UJwVwrlUYUetHb0tfBr+BKzCGIyg15CqykTRTpQSXnLhjyLmJJd2RBX2
         cvcowiASbS+akuskq2Sna3ut994Qa6xyQ8ycG7mH2HxRis+5POvq8Mk59z+Plcn/2F
         eP2F0qq5qrCK1Yd/vMsQVlhuj27gh9w1p/Jk/j/YYwpS+CnDKaoALX7Of6xcYh9SOb
         gRJ15TbFPfBeA==
In-Reply-To: <20221218162016.934280-1-sashal@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Kees Cook <keescook@chromium.org>, Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>, t.sailer@alumni.ethz.ch, davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, ndesaulniers@google.com, linux-hams@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit c5733e5b15d91ab679646ec3149e192996a27d5d ]

With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
indirect call targets are validated against the expected function
pointer prototype to make sure the call target is valid to help mitigate
ROP attacks. If they are not identical, there is a failure at run time,
which manifests as either a kernel panic or thread getting killed. A
proposed warning in clang aims to catch these at compile time, which
reveals:

  drivers/net/hamradio/baycom_epp.c:1119:25: error: incompatible function pointer types initializing 'netdev_tx_t (*)(struct sk_buff *, struct net_device *)' (aka 'enum netdev_tx (*)(struct sk_buff *, struct net_device *)') with an expression of type 'int (struct sk_buff *, struct net_device *)' [-Werror,-Wincompatible-function-pointer-types-strict]
          .ndo_start_xmit      = baycom_send_packet,
                                ^~~~~~~~~~~~~~~~~~
  1 error generated.

->ndo_start_xmit() in 'struct net_device_ops' expects a return type of
'netdev_tx_t', not 'int'. Adjust the return type of baycom_send_packet()
to match the prototype's to resolve the warning and CFI failure.

Link: https://github.com/ClangBuiltLinux/linux/issues/1750
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20221102160610.1186145-1-nathan@kernel.org
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/hamradio/baycom_epp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/hamradio/baycom_epp.c b/drivers/net/hamradio/baycom_epp.c
index 1e62d00732f2..787eaf3f4f13 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -772,7 +772,7 @@ static void epp_bh(struct work_struct *work)
  * ===================== network driver interface =========================
  */
 
-static int baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
 	struct baycom_state *bc = netdev_priv(dev);
 
-- 
2.35.1

