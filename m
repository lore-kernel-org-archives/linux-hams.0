From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH 112/141] net: rose: Fix fall-through warnings for Clang
Date: Fri, 20 Nov 2020 12:38:32 -0600
Message-ID: <a1b09757cea712d628d1651477f459c8f4d65300.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605897506;
        bh=PkWMbNHUqRE72YncI3aAbekle6zPRx7ucQ1kVnXaWHU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YM+77cZtD5U9Ugo/SkJZ1hhHKr7V8RS3tEmgu7gLSpqmCASN4Bvq0si28qKg744sW
         IX2hxWNM81E/VA6ZVIpjODt7mlEJeuVT5msxaPuO9MElEShnKdex12DEDabzJYTS4/
         5ayHe2iiCiOhu4ZnLDiIEFGXFU6O6FBPhvUEIMvg=
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
warnings by explicitly adding multiple break statements instead of
letting the code fall through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 net/rose/rose_route.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/rose_route.c b/net/rose/rose_route.c
index 6e35703ff353..c0e04c261a15 100644
--- a/net/rose/rose_route.c
+++ b/net/rose/rose_route.c
@@ -347,6 +347,7 @@ static int rose_del_node(struct rose_route_struct *rose_route,
 				case 1:
 					rose_node->neighbour[1] =
 						rose_node->neighbour[2];
+					break;
 				case 2:
 					break;
 				}
@@ -508,6 +509,7 @@ void rose_rt_device_down(struct net_device *dev)
 					fallthrough;
 				case 1:
 					t->neighbour[1] = t->neighbour[2];
+					break;
 				case 2:
 					break;
 				}
-- 
2.27.0

