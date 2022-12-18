From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.1 25/85] hamradio: baycom_epp: Fix return type of baycom_send_packet()
Date: Sun, 18 Dec 2022 11:00:42 -0500
Message-ID: <20221218160142.925394-25-sashal@kernel.org>
References: <20221218160142.925394-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671379398;
        bh=jlpB92qp8qPbGD3eBHDDa59gnNq7MLHT6unlOv+GfzY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JD4IL4UoW/aHYGuKDTeAEFs9RR4XSqm6QiPYrnh6p+w05fS3gvpKY9O2aUtJNsDLs
         6I4cc2/LOFSDIutqlNmSs11D8M2FcyUmmwG+e2w/HyEouEK8trYi9sg2m1DsASGP1o
         P9qw5e4GoUKtB/I1924ZehOrtzi2WWX7Tn7W99+GSEmSIVlb0r4y34rbj3JMXx+JOD
         74ufoswaSMOJr1enHqQcuwTqYaoVJEqMXitvcyRqUJvdlH51Z2tC9lPzio6oLKM5aN
         7GxereImUb1+/5iYMQd1WqL96+P/O9DkSJkDUo0+7rLzIUdr18RNdIj1PDX5O5KlUB
         0EjXYSWwKkcEw==
In-Reply-To: <20221218160142.925394-1-sashal@kernel.org>
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
index 791b4a53d69f..bd3b0c2655a2 100644
--- a/drivers/net/hamradio/baycom_epp.c
+++ b/drivers/net/hamradio/baycom_epp.c
@@ -758,7 +758,7 @@ static void epp_bh(struct work_struct *work)
  * ===================== network driver interface =========================
  */
 
-static int baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t baycom_send_packet(struct sk_buff *skb, struct net_device *dev)
 {
 	struct baycom_state *bc = netdev_priv(dev);
 
-- 
2.35.1

