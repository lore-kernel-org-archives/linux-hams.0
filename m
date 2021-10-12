From: Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 6/6] decnet: constify dev_addr passing
Date: Tue, 12 Oct 2021 08:58:40 -0700
Message-ID: <20211012155840.4151590-7-kuba@kernel.org>
References: <20211012155840.4151590-1-kuba@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634054331;
        bh=6tHcTSYirflEJc5fhpvAOLmYQzhXj44aomInZHnL7TA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JNNer5vNV+ZFYdlrg8Jv474etPsQcF7BzwXR/aAWa6gLI//MROwF9kRBrQurq8egV
         jtnjdd+ell3cWTOea1MK6Ihf2MpClT3Rx3qGc/7YbdWXp3KfuYaC14rV6b4yI0ZGKB
         GUpEo72BGUorLlPa/2DdlBzX0SH7wzWk1GDUqiZ9bjF35hFIbCZI72sPyiCZQz6NuP
         UE8mkAGR+qpem50b1/CLyUuSNCrkYmWnEJ/1BweHQ+G4jCE3Vncq31KFZiKUQNFiS5
         NCjSQ63nAdYsJkmHX8DCbffdC3me36l5TLDSlJpksELxOVAM0APnjEss6Jjfg7Se3f
         87FUVdZp0Szig==
In-Reply-To: <20211012155840.4151590-1-kuba@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, ralf@linux-mips.org, jreuter@yaina.de, yoshfuji@linux-ipv6.org, dsahern@kernel.org, jmaloy@redhat.com, ying.xue@windriver.com, linux-hams@vger.kernel.org, tipc-discussion@lists.sourceforge.net, Jakub Kicinski <kuba@kernel.org>

In preparation for netdev->dev_addr being constant
make all relevant arguments in decnet constant.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 include/net/dn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/dn.h b/include/net/dn.h
index 56ab0726c641..ba9655b0098a 100644
--- a/include/net/dn.h
+++ b/include/net/dn.h
@@ -166,7 +166,7 @@ struct dn_skb_cb {
 	int iif;
 };
 
-static inline __le16 dn_eth2dn(unsigned char *ethaddr)
+static inline __le16 dn_eth2dn(const unsigned char *ethaddr)
 {
 	return get_unaligned((__le16 *)(ethaddr + 4));
 }
-- 
2.31.1

