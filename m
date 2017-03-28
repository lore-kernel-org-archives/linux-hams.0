From: Elena Reshetova <elena.reshetova@intel.com>
Subject: [PATCH 13/16] drivers, net,
 ppp: convert ppp_file.refcnt from atomic_t to refcount_t
Date: Tue, 28 Mar 2017 11:56:40 +0300
Message-ID: <1490691403-4016-14-git-send-email-elena.reshetova@intel.com>
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
	bh=4Od3Nmle5ubJAqFST0aCs7OUwBnBjuhD71Upx59/uwo=; b=QS6ah3n9AhktEkHw/oosx1Ezec
	rfwfZ/EkrnU8rX8H7rgXiYqYPkvYGixbFvXFPdb5FnUvmCnx6+LUII9cZa1bOaLTqONf/jYZX+iDn
	V/KE/q0+KcCt1eiULAV1aCje9ZFVNBLuTRqiBlXaoxZfHuDqo5ohuvAPVnIbMDUBd/t1YUJXMxA2z
	nUE3u34X/BECR3kSYVY2NEBJOiOmauORJqu7uHgX0YOwAxeYZi23y4BVpI/u+8N6h8VmZNt11PTr9
	Qzq+F5W4zCPVpWFtMrCDJ3gBpfnQcmSqoy312iUhwjPFOXRRoXXTUxenks1CJomie3PHnDxVK3YLh
	QQsREhVw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S5KDn32+UWEyipQ7E2AYTRjOXgbRiTBKPloWwpKx5Hs=; b=H24YaTU9lSA/LH1Qhdmx+jKLu
 oxaM8Kojx5EySbV0GQXNDGZgnpc8++cKzLwu3cdN95Aj0ecNRTNeRadbL7+UNdMFBq9J9G+NaPmRT
 6V7p9YH6hJIqNx1Ytev76vOWdp6GpXaViY1Prktun9lcNtICDlghKm28rs+OlxL0xGIBolXlBA1wm
 eNifzDWLzXm0TikJFoTvy3E37LNaqeEgutLNwwTqFkwXD1ruu+S/GS3GwfinurlX9PW5ZKLDoeERI
 KyfGQ5DhVuBWf5rhKSFyl4dHHhFDr0N+VllWLGsHUQc2uPL9ifEBfYxXmIRBEHDJVvsUvl8q8L456
 Mt9cU3IPw==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=intel;
 t=1490691525; x=1522227525;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=IOnLsyIUPg6lwyz51M82kIMQyiyGLjJkE4EiL3zNfl4=;
 b=SERgPUB1P/jioQylXa7EmRcPhdie+hqjibjw5erXgE+jlOAw2jpEQTeq
 0bxg2hCRlJsauFzEKUoNB9ApNVAU/A==;
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
 drivers/net/ppp/ppp_generic.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
index f9c0e62..7b1352c 100644
--- a/drivers/net/ppp/ppp_generic.c
+++ b/drivers/net/ppp/ppp_generic.c
@@ -51,6 +51,7 @@
 #include <asm/unaligned.h>
 #include <net/slhc_vj.h>
 #include <linux/atomic.h>
+#include <linux/refcount.h>
 
 #include <linux/nsproxy.h>
 #include <net/net_namespace.h>
@@ -84,7 +85,7 @@ struct ppp_file {
 	struct sk_buff_head xq;		/* pppd transmit queue */
 	struct sk_buff_head rq;		/* receive queue for pppd */
 	wait_queue_head_t rwait;	/* for poll on reading /dev/ppp */
-	atomic_t	refcnt;		/* # refs (incl /dev/ppp attached) */
+	refcount_t	refcnt;		/* # refs (incl /dev/ppp attached) */
 	int		hdrlen;		/* space to leave for headers */
 	int		index;		/* interface unit / channel number */
 	int		dead;		/* unit/channel has been shut down */
@@ -407,7 +408,7 @@ static int ppp_release(struct inode *unused, struct file *file)
 				unregister_netdevice(ppp->dev);
 			rtnl_unlock();
 		}
-		if (atomic_dec_and_test(&pf->refcnt)) {
+		if (refcount_dec_and_test(&pf->refcnt)) {
 			switch (pf->kind) {
 			case INTERFACE:
 				ppp_destroy_interface(PF_TO_PPP(pf));
@@ -880,7 +881,7 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 		mutex_lock(&pn->all_ppp_mutex);
 		ppp = ppp_find_unit(pn, unit);
 		if (ppp) {
-			atomic_inc(&ppp->file.refcnt);
+			refcount_inc(&ppp->file.refcnt);
 			file->private_data = &ppp->file;
 			err = 0;
 		}
@@ -895,7 +896,7 @@ static int ppp_unattached_ioctl(struct net *net, struct ppp_file *pf,
 		spin_lock_bh(&pn->all_channels_lock);
 		chan = ppp_find_channel(pn, unit);
 		if (chan) {
-			atomic_inc(&chan->file.refcnt);
+			refcount_inc(&chan->file.refcnt);
 			file->private_data = &chan->file;
 			err = 0;
 		}
@@ -2641,7 +2642,7 @@ ppp_unregister_channel(struct ppp_channel *chan)
 
 	pch->file.dead = 1;
 	wake_up_interruptible(&pch->file.rwait);
-	if (atomic_dec_and_test(&pch->file.refcnt))
+	if (refcount_dec_and_test(&pch->file.refcnt))
 		ppp_destroy_channel(pch);
 }
 
@@ -3011,7 +3012,7 @@ init_ppp_file(struct ppp_file *pf, int kind)
 	pf->kind = kind;
 	skb_queue_head_init(&pf->xq);
 	skb_queue_head_init(&pf->rq);
-	atomic_set(&pf->refcnt, 1);
+	refcount_set(&pf->refcnt, 1);
 	init_waitqueue_head(&pf->rwait);
 }
 
@@ -3128,7 +3129,7 @@ ppp_connect_channel(struct channel *pch, int unit)
 	list_add_tail(&pch->clist, &ppp->channels);
 	++ppp->n_channels;
 	pch->ppp = ppp;
-	atomic_inc(&ppp->file.refcnt);
+	refcount_inc(&ppp->file.refcnt);
 	ppp_unlock(ppp);
 	ret = 0;
 
@@ -3159,7 +3160,7 @@ ppp_disconnect_channel(struct channel *pch)
 		if (--ppp->n_channels == 0)
 			wake_up_interruptible(&ppp->file.rwait);
 		ppp_unlock(ppp);
-		if (atomic_dec_and_test(&ppp->file.refcnt))
+		if (refcount_dec_and_test(&ppp->file.refcnt))
 			ppp_destroy_interface(ppp);
 		err = 0;
 	}
-- 
2.7.4
