From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: [PATCH 3/3] Cleanup direct calls into IP stack
Date: Wed, 24 Aug 2005 18:17:12 +0100
Message-ID: <20050824171712.GB8367@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: netdev@linux-mips.org, linux-hams@vger.kernel.org

With ip_rcv nowhere outside the IP stack being used anymore it's
EXPORT_SYMBOL is not needed any longer either.

Signed-off-by: Ralf Baechle DL5RB <ralf@linux-mips.org>

 net/ipv4/ip_input.c |    1 -
 1 files changed, 1 deletion(-)

Index: linux-cvs/net/ipv4/ip_input.c
===================================================================
--- linux-cvs.orig/net/ipv4/ip_input.c
+++ linux-cvs/net/ipv4/ip_input.c
@@ -428,5 +428,4 @@ out:
         return NET_RX_DROP;
 }
 
-EXPORT_SYMBOL(ip_rcv);
 EXPORT_SYMBOL(ip_statistics);
