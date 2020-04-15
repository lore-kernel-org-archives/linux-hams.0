From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Subject: [PATCH] net: netrom: Fix potential nr_neigh refcnt leak in nr_add_node
Date: Wed, 15 Apr 2020 16:36:19 +0800
Message-ID: <1586939780-69791-1-git-send-email-xiyuyang19@fudan.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
        Message-Id; bh=e38fCYno9Kg9NlWmZaHhXh61HmgAfMMOj8Y0iA5cL+s=; b=a
        owa2vF1f4sVbxAm5sfCk7LCq0+kPR80uHE0lAA/A1rhwAAKRyK9bA5YxTWw9+o2X
        qmbmNqmOTQKzxXMCV2LrOuNIzpCIXf2cuEYGwvX6O3QclJJvAu50bYV9hBDsE18L
        PN1GkD4XYGi4Ek7gvQrdvacN9IZYcbYlB90iS+KaZ0=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-hams.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yuanxzhang@fudan.edu.cn, kjlu@umn.edu, Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>

nr_add_node() invokes nr_neigh_get_dev(), which returns a local
reference of the nr_neigh object to "nr_neigh" with increased refcnt.

When nr_add_node() returns, "nr_neigh" becomes invalid, so the refcount
should be decreased to keep refcount balanced.

The issue happens in one normal path of nr_add_node(), which forgets to
decrease the refcnt increased by nr_neigh_get_dev() and causes a refcnt
leak. It should decrease the refcnt before the function returns like
other normal paths do.

Fix this issue by calling nr_neigh_put() before the nr_add_node()
returns.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 net/netrom/nr_route.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netrom/nr_route.c b/net/netrom/nr_route.c
index d41335bad1f8..89cd9de21594 100644
--- a/net/netrom/nr_route.c
+++ b/net/netrom/nr_route.c
@@ -208,6 +208,7 @@ static int __must_check nr_add_node(ax25_address *nr, const char *mnemonic,
 		/* refcount initialized at 1 */
 		spin_unlock_bh(&nr_node_list_lock);
 
+		nr_neigh_put(nr_neigh);
 		return 0;
 	}
 	nr_node_lock(nr_node);
-- 
2.7.4

