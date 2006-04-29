From: Ralf Baechle <ralf@linux-mips.org>
Subject: [ROSE] Fix routing table locking in rose_remove_neigh.
Date: Sat, 29 Apr 2006 14:31:41 +0100
Message-ID: <20060429133141.GA31820@linux-mips.org>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Bernard Pidoux <pidoux@ccr.jussieu.fr>, linux-hams@vger.kernel.org

The locking rule for rose_remove_neigh() are that the called needs to
hold rose_neigh_list_lock, so we better don't take it yet again in
rose_neigh_list_lock.

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>

 net/rose/rose_route.c |    5 -----
 1 file changed, 5 deletions(-)

Index: linux-net.git/net/rose/rose_route.c
===================================================================
--- linux-net.git.orig/net/rose/rose_route.c	2006-04-29 14:18:58.000000000 +0100
+++ linux-net.git/net/rose/rose_route.c	2006-04-29 14:19:02.000000000 +0100
@@ -233,11 +233,8 @@ static void rose_remove_neigh(struct ros
 
 	skb_queue_purge(&rose_neigh->queue);
 
-	spin_lock_bh(&rose_neigh_list_lock);
-
 	if ((s = rose_neigh_list) == rose_neigh) {
 		rose_neigh_list = rose_neigh->next;
-		spin_unlock_bh(&rose_neigh_list_lock);
 		kfree(rose_neigh->digipeat);
 		kfree(rose_neigh);
 		return;
@@ -246,7 +243,6 @@ static void rose_remove_neigh(struct ros
 	while (s != NULL && s->next != NULL) {
 		if (s->next == rose_neigh) {
 			s->next = rose_neigh->next;
-			spin_unlock_bh(&rose_neigh_list_lock);
 			kfree(rose_neigh->digipeat);
 			kfree(rose_neigh);
 			return;
@@ -254,7 +250,6 @@ static void rose_remove_neigh(struct ros
 
 		s = s->next;
 	}
-	spin_unlock_bh(&rose_neigh_list_lock);
 }
 
 /*
