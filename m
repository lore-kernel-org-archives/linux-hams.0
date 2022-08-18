From: Francois Romieu <romieu@fr.zoreil.com>
Subject: [PATCH v2 net 1/1] rose: check NULL rose_loopback_neigh->loopback
Date: Thu, 18 Aug 2022 02:02:13 +0200
Message-ID: <Yv2BhXInteHP7eJm@electric-eye.fr.zoreil.com>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 violet.fr.zoreil.com 27I02OJS2737980
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fr.zoreil.com;
        s=v20220413; t=1660780944;
        bh=FLx6q8AWTB/vvqR4DZpb3VA90jfURiRO0HztmhtSKjo=;
        h=Date:From:To:Cc:Subject:From;
        b=RVfkPrCKHa3ssc+7YpNzeJhkxK8kMTpCsLOPFQGmaTpn+BzdsRIyvCfUPyxr+/97J
         z7B1fPErIlvASEGnP3MEUIE2sAVwcOSxY9M0n7zSgW6cQalmli7d8+7YqgslrjY4D7
         x7rS+a0I/x3vAq/q8o/gLaaVb1EIba/C4ekuf/Nw=
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org, Bernard <bernard.f6bvp@gmail.com>, Bernard Pidoux <f6bvp@free.fr>, Thomas Osterried <thomas@osterried.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>

From: Bernard Pidoux <f6bvp@free.fr>

Commit 3b3fd068c56e3fbea30090859216a368398e39bf added NULL check for
`rose_loopback_neigh->dev` in rose_loopback_timer() but omitted to
check rose_loopback_neigh->loopback.

It thus prevents *all* rose connect.

The reason is that a special rose_neigh loopback has a NULL device.

/proc/net/rose_neigh illustrates it via rose_neigh_show() function :
[...]
seq_printf(seq, "%05d %-9s %-4s   %3d %3d  %3s     %3s %3lu %3lu",
	   rose_neigh->number,
	   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
	   rose_neigh->dev ? rose_neigh->dev->name : "???",
	   rose_neigh->count,

/proc/net/rose_neigh displays special rose_loopback_neigh->loopback as
callsign RSLOOP-0:

addr  callsign  dev  count use mode restart  t0  tf digipeaters
00001 RSLOOP-0  ???      1   2  DCE     yes   0   0

By checking rose_loopback_neigh->loopback, rose_rx_call_request() is called
even in case rose_loopback_neigh->dev is NULL. This repairs rose connections.

Verification with rose client application FPAC:

FPAC-Node v 4.1.3 (built Aug  5 2022) for LINUX (help = h)
F6BVP-4 (Commands = ?) : u
Users - AX.25 Level 2 sessions :
Port   Callsign     Callsign  AX.25 state  ROSE state  NetRom status
axudp  F6BVP-5   -> F6BVP-9   Connected    Connected   ---------

Fixes: 3b3fd068c56e ("rose: Fix Null pointer dereference in rose_send_frame()")
Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
Suggested-by: Francois Romieu <romieu@fr.zoreil.com>
Cc: Thomas DL9SAU Osterried <thomas@osterried.de>
---

 Regression appeared in the v5.9..v5.10 cycle. The fix above also applies as-is
 to stable v5.4, stable v4.19 and stable v4.14. 

 net/rose/rose_loopback.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 11c45c8c6c16..036d92c0ad79 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,7 +96,8 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if (!rose_loopback_neigh->dev) {
+			if (!rose_loopback_neigh->dev &&
+			    !rose_loopback_neigh->loopback) {
 				kfree_skb(skb);
 				continue;
 			}
-- 
2.37.1
