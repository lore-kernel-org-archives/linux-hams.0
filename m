From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] net: rose: Fix fall-through warnings for Clang
Date: Fri, 5 Mar 2021 01:44:17 -0600
Message-ID: <20210305074417.GA123270@embeddedor>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614930261;
        bh=PkWMbNHUqRE72YncI3aAbekle6zPRx7ucQ1kVnXaWHU=;
        h=Date:From:To:Cc:Subject:From;
        b=RhOM/HW91RbEuOzIlgJ4q5VTneRntHm51LQS0LNMuR1Ok9mSS150JFrjZUhitK/EC
         /iEM7YWs4MSTjH9vPuesPj9uWf7Go+2WkZS2tLC7hPUr1QSRNAoU/EV+f1ZAjnPF8/
         eDx4i9bb5E7gU6w11cfceBE5p4we+sGAj3ywYQnA6zPMfEnwjHrCb37xESOm8aFka9
         bpkNQSS3IKMjggJTaaJyC9ONxrOYwnOeXOnQw12MGEOn0sa7U1Bfg5sYqlstFaxUO+
         l0sEC+xgh7CBoLbKgJ0IF3s1oIm+HPxLHjN9cn8vdwxl/m+93apAXmHLhh2P+Ar9u4
         HICIXT3O1718g==
Content-Disposition: inline
List-ID: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org

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

