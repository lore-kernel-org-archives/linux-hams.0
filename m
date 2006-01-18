From: Ralf Baechle DL5RB <ralf@linux-mips.org>
Subject: Re: ROSE lockup fix
Date: Wed, 18 Jan 2006 08:38:16 +0000
Message-ID: <20060118083816.GA7510@linux-mips.org>
References: <9923fd660601110945p4c4ce12aw3311ae7e55111df1@mail.gmail.com> <000d01c616fc$5624f4b0$3849a8c0@lan.w1nr.net> <20060113210925.GB3516@linux-mips.org> <43CD2275.8050602@ccr.jussieu.fr> <20060118010843.GA3312@linux-mips.org>
Mime-Version: 1.0
Return-path: <linux-hams-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060118010843.GA3312@linux-mips.org>
Sender: linux-hams-owner@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernard Pidoux <pidoux@ccr.jussieu.fr>
Cc: linux-hams@vger.kernel.org

On Wed, Jan 18, 2006 at 01:08:43AM +0000, Ralf Baechle DL5RB wrote:

> Anyway, the problem is pretty obvious in your traceback and I'll cook a
> patch for you to test.

Can you test the patch below?

  Ralf

 net/rose/rose_route.c |    7 -------
 1 files changed, 7 deletions(-)

Index: linux-mips/net/rose/rose_route.c
===================================================================
--- linux-mips.orig/net/rose/rose_route.c
+++ linux-mips/net/rose/rose_route.c
@@ -48,8 +48,6 @@ static DEFINE_SPINLOCK(rose_route_list_l
 
 struct rose_neigh *rose_loopback_neigh;
 
-static void rose_remove_neigh(struct rose_neigh *);
-
 /*
  *	Add a new route to a node, and in the process add the node and the
  *	neighbour if it is new.
@@ -235,11 +233,8 @@ static void rose_remove_neigh(struct ros
 
 	skb_queue_purge(&rose_neigh->queue);
 
-	spin_lock_bh(&rose_neigh_list_lock);
-
 	if ((s = rose_neigh_list) == rose_neigh) {
 		rose_neigh_list = rose_neigh->next;
-		spin_unlock_bh(&rose_neigh_list_lock);
 		kfree(rose_neigh->digipeat);
 		kfree(rose_neigh);
 		return;
@@ -248,7 +243,6 @@ static void rose_remove_neigh(struct ros
 	while (s != NULL && s->next != NULL) {
 		if (s->next == rose_neigh) {
 			s->next = rose_neigh->next;
-			spin_unlock_bh(&rose_neigh_list_lock);
 			kfree(rose_neigh->digipeat);
 			kfree(rose_neigh);
 			return;
@@ -256,7 +250,6 @@ static void rose_remove_neigh(struct ros
 
 		s = s->next;
 	}
-	spin_unlock_bh(&rose_neigh_list_lock);
 }
 
 /*
