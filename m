From: Jules Irenge <jbi.octave@gmail.com>
Subject: [PATCH] net: ax25: Fix  multiple blank lines warning
Date: Sat, 23 Feb 2019 11:17:51 +0000
Message-ID: <20190223111751.14620-1-jbi.octave@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+GsSC8kWeNV/R5tzYgG2c+8rJl0TR4KyHpnRG356StI=;
        b=fRrBQi1D01cnqbMJVM4n0JMvL8mc0axr2ZstRz/OxbFmzvrYUELvT8u4HD9R5Czgcf
         CPjnn8YS5g7G/ejmZY7pEQwdFP9GJPM/7vJlW7qkEJRKb/06UVU7iH2oTGnDMasZecFQ
         +FrK02J5qO2pa4TAxL2pmksE7axb+ZaoSvKsmG6HPj/HR/LjF0n/Mx7TbYba7Ddn/40i
         y+ayWOuT2osOwgZXdbCtD1g7is2W6oTaH70PWf37msDR5fvk5v4/UQaf4d+3tJDeDtKu
         fzzdiwn+O0W9tV0kdEHiEJWLCQO8XenlojapcqPWX7VAOV3vaJF5zoRRoWIZj+94n0yr
         /yDA==
Sender: netdev-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jreuter@yaina.de
Cc: linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, ralf@linux-mips.org, netdev@vger.kernel.org, outreachy-kernel@googlegroups.com, jbi.octave@gmail.com

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 net/ax25/af_ax25.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/ax25/af_ax25.c b/net/ax25/af_ax25.c
index 5048790a75f6..2da349b7854a 100644
--- a/net/ax25/af_ax25.c
+++ b/net/ax25/af_ax25.c
@@ -49,8 +49,6 @@
 #include <net/ip.h>
 #include <net/arp.h>
 
-
-
 HLIST_HEAD(ax25_list);
 DEFINE_SPINLOCK(ax25_list_lock);
 
-- 
2.20.1

