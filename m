From: Elena Reshetova <elena.reshetova@intel.com>
Subject: [PATCH 14/16] drivers, net,
 ppp: convert syncppp.refcnt from atomic_t to refcount_t
Date: Tue, 28 Mar 2017 11:56:41 +0300
Message-ID: <1490691403-4016-15-git-send-email-elena.reshetova@intel.com>
References: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yVAOd/+ZpZUGmaUO+aVEpZk26kMPNPzXxEkQqZBsLPQ=; b=bxwW9g7aRh+21xiEP4HpqIJzDw
	deQCY4gw11t5Ek3yytCXb5wP5vJjLq3AT6r6TbnFnW3ems4PJo1LFXFjlhVSzJ08Uw77sT6++KZZx
	Hvf7m78z9JUjJDxi3okuTiedG2K+R8v9ICEJBewiHpngVCHf6GaUyGP+owhAU/94/hvZvy1Rta3Yh
	CqYwQsVHFoKVZYnba8c316THqpmb4xZX1gQMnBFTyCxN0/k746PhY7Zy1qUjf3zJEnL9ANtvDPIHw
	D5vucTMULE6i4MpGzz+xWvcbIHyfRcXZ9U1byLufNPbGnHTkfsGCG/tLiyd5tY8wh605AWsh+j0RP
	Z0ydZ1Ag==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LQacjwQoBYMgJVYaIqrK5cNwvXLipZYR77rNPd686MA=; b=p+WdDAL8PRSHfJj/827TqdR8f
 dzZmhRgAat7jYGNujU3TcMb7Vd8KJF1wNJG1EAPz81rxC3ddSDGO2RnM3jaifKm+mrUIT5HSpEAqI
 hd891nEtDamwPjVyYMzY3F4Jk4hj5oRjOPLX1SMXMGIbqLWGinscUKDjZGmD1ILDoJaACzt8MOr7U
 /+ikIZV0ae/N8ro3T40bzbHzBO66/BUr0+4zo1TIZgMyiT71Onb2NtoQVLRC1BQkHeHG3ElYerPTZ
 bYxVzO6WbypEt4oUXnYv1LDW86K2u54AHyd3Z16jx1gcVhHBBalm7VQr7Q+6a0v3eMF5w52DBpyaw
 2OEc7A8kw==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=intel;
 t=1490691531; x=1522227531;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=wGWVxvxD3ePVK04snav1PQ56XJFktTEUNVUWjFAL9wI=;
 b=dgvKIx9OEvCU6PlS/8RyY6zbhkdUWstvU7QPJgRF9g8QJXOmJyJbPXdl
 7f4mkkZeb4d8PDKtsGj6+q1ednbuog==;
In-Reply-To: <1490691403-4016-1-git-send-email-elena.reshetova@intel.com>
List-Id: <linux-hams.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: netdev@vger.kernel.org
Cc: peterz@infradead.org, matanb@mellanox.com, paulus@samba.org, Elena Reshetova <elena.reshetova@intel.com>, nbd@openwrt.org, linux-rdma@vger.kernel.org, saeedm@mellanox.com, ganeshgr@chelsio.com, Hans Liljestrand <ishkamiel@gmail.com>, David Windsor <dwindsor@gmail.com>, keescook@chromium.org, j@w1.fi, ajk@comnets.uni-bremen.de, leonro@mellanox.com, matthias.bgg@gmail.com, linux-hams@vger.kernel.org, kvalo@codeaurora.org, blogic@openwrt.org, linux-arm-kernel@lists.infradead.org, linux-ppp@vger.kernel.org, yishaih@mellanox.com, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org

refcount_t type and corresponding API should be
used instead of atomic_t when the variable is used as
a reference counter. This allows to avoid accidental
refcounter overflows that might lead to use-after-free
situations.

Signed-off-by: Elena Reshetova <elena.reshetova@intel.com>
Signed-off-by: Hans Liljestrand <ishkamiel@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: David Windsor <dwindsor@gmail.com>
---
 drivers/net/ppp/ppp_synctty.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ppp/ppp_synctty.c b/drivers/net/ppp/ppp_synctty.c
index 9ae5398..4a643f8 100644
--- a/drivers/net/ppp/ppp_synctty.c
+++ b/drivers/net/ppp/ppp_synctty.c
@@ -46,6 +46,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/slab.h>
+#include <linux/refcount.h>
 #include <asm/unaligned.h>
 #include <linux/uaccess.h>
 
@@ -72,7 +73,7 @@ struct syncppp {
 
 	struct tasklet_struct tsk;
 
-	atomic_t	refcnt;
+	refcount_t	refcnt;
 	struct completion dead_cmp;
 	struct ppp_channel chan;	/* interface to generic ppp layer */
 };
@@ -141,14 +142,14 @@ static struct syncppp *sp_get(struct tty_struct *tty)
 	read_lock(&disc_data_lock);
 	ap = tty->disc_data;
 	if (ap != NULL)
-		atomic_inc(&ap->refcnt);
+		refcount_inc(&ap->refcnt);
 	read_unlock(&disc_data_lock);
 	return ap;
 }
 
 static void sp_put(struct syncppp *ap)
 {
-	if (atomic_dec_and_test(&ap->refcnt))
+	if (refcount_dec_and_test(&ap->refcnt))
 		complete(&ap->dead_cmp);
 }
 
@@ -182,7 +183,7 @@ ppp_sync_open(struct tty_struct *tty)
 	skb_queue_head_init(&ap->rqueue);
 	tasklet_init(&ap->tsk, ppp_sync_process, (unsigned long) ap);
 
-	atomic_set(&ap->refcnt, 1);
+	refcount_set(&ap->refcnt, 1);
 	init_completion(&ap->dead_cmp);
 
 	ap->chan.private = ap;
@@ -232,7 +233,7 @@ ppp_sync_close(struct tty_struct *tty)
 	 * our channel ops (i.e. ppp_sync_send/ioctl) are in progress
 	 * by the time it returns.
 	 */
-	if (!atomic_dec_and_test(&ap->refcnt))
+	if (!refcount_dec_and_test(&ap->refcnt))
 		wait_for_completion(&ap->dead_cmp);
 	tasklet_kill(&ap->tsk);
 
-- 
2.7.4
