From: bernard.f6bvp@gmail.com
Subject: [PATCH] rose: check NULL rose_loopback_neigh->loopback
Date: Tue, 16 Aug 2022 20:51:40 +0200
Message-ID: <20220816185140.9129-1-bernard.f6bvp@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=LelQJvF7zxFbcLTMVJBAC3ic54PTqj8BI7T6uO42R/g=;
        b=Jxur5a7liBp1PmhjSOcKVdU6u6dilPcqzQOqarV3aWjxxH51gEsLKvWlFjN3EWFBXO
         BBNILfQtiFUHfDtwQZKw2sGfxi3I8QYLd0qkkjwNgrge2VU/qRN5SQmzQGrA+onAgY1z
         d1ID1LAwkKtznqESpJSwQNFf1fSpcyzAtOG2q3UVhQyXVl2ow6feR3433o28fvAP5qT4
         tbav2ZS49sK4W7AtL+re2ihcdqZEKnFT6aIP5P3PSM+DEnwqpdk/HC/8aCTFxuQiYj09
         pJdZXemzm8GF7vbjBNMEqK+oslPblhQX2NzuvvUigB/n5taGdbVoO+GptZlGIhqiVY46
         w4tw==
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Thomas Osterried <thomas@osterried.de>, Francois Romieu <romieu@fr.zoreil.com>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, Bernard <bernard.f6bvp@gmail.com>, Bernard Pidoux <f6bvp@free.fr>

From: Bernard <bernard.f6bvp@gmail.com>

Since kernel 5.4.83 rose network connections were no more possible.
Last good rose module was with kernel 5.4.79.

Francois Romieu <romieu@fr.zoreil.com> pointed the scope of changes to
the attached commit (3b3fd068c56e3fbea30090859216a368398e39bf
in mainline, 7f0ddd41e2899349461b578bec18e8bd492e1765 in stable).

Above patch added NULL check for `rose_loopback_neigh->dev`
in rose_loopback_timer() but omitted to check rose_loopback_neigh->loopback.

It thus introduced a bug preventing ALL rose connect.
The reason is that a special rose_neigh loopback has a NULL device.

This is shown in /proc/net/rose_neigh via rose_neigh_show() function :
...
	seq_printf(seq, "%05d %-9s %-4s   %3d %3d  %3s     %3s %3lu %3lu",
	   rose_neigh->number,
	   (rose_neigh->loopback) ? "RSLOOP-0" : ax2asc(buf, &rose_neigh->callsign),
	   rose_neigh->dev ? rose_neigh->dev->name : "???",
	   rose_neigh->count,
...
/proc/net/rose_neigh displays special rose_loopback_neigh->loopback callsign RSLOOP-0:

addr  callsign  dev  count use mode restart  t0  tf digipeaters
00001 RSLOOP-0  ???      1   2  DCE     yes   0   0

By checking rose_loopback_neigh->loopback, rose_rx_call_request() is called even in case 
rose_loopback_neigh->dev is NULL. This repairs rose connections.

Verification with rose client application FPAC:

FPAC-Node v 4.1.3 (built Aug  5 2022) for LINUX (help = h)
F6BVP-4 (Commands = ?) : u
Users - AX.25 Level 2 sessions :
Port   Callsign     Callsign  AX.25 state  ROSE state  NetRom status
axudp  F6BVP-5   -> F6BVP-9   Connected    Connected   ---------

IMHO this patch should be propagated back to LTS 5.4 kernel.

Signed-off-by: Bernard Pidoux <f6bvp@free.fr>
---
 net/rose/rose_loopback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 11c45c8c6c16..1c673db52636 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -97,8 +97,10 @@ static void rose_loopback_timer(struct timer_list *unused)

		if (frametype == ROSE_CALL_REQUEST) {
			if (!rose_loopback_neigh->dev) {
-				kfree_skb(skb);
-				continue;
+				if (!rose_loopback_neigh->loopback) {
+					kfree_skb(skb);
+					continue;
+				}
			}

			dev = rose_dev_get(dest);
--
2.34.1

