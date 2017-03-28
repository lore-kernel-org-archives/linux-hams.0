From: Elena Reshetova <elena.reshetova@intel.com>
Subject: [PATCH 05/16] drivers, net,
 mlx4: convert mlx4_srq.refcount from atomic_t to refcount_t
Date: Tue, 28 Mar 2017 11:56:32 +0300
Message-ID: <1490691403-4016-6-git-send-email-elena.reshetova@intel.com>
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
	bh=oum3R4EatnvB3c7q9VR1ryzUa3xnQWQkcB/Fpp9TKDs=; b=tZiXHM/Sm+zbIfoPStem7edYJo
	v79O8AFLkYuTPTLP9MvzYRAsFekYWZlchcVy1czFUNLOYLf2357EdgfnVIC+SWRN8UkeK9/wcZX2Y
	vno0J7X7kNwnpH3mjNTSdCAs2m2DYoIqyIjs43ZLhKLwdJUrsfAM5V/jtagRzU7uzQ+yRb9PsTD7/
	uZ6jY7acXGycpHtVqQIL6+REh/OtWiPyUTOPSsd1rotsoPmnUaEBYx0vgKz+ppP4JRr1AFDSnohvL
	KTz6o0Iiay64M9LVdeHRfPKG5YM/yvFOMcAUdHshJGb4DykOHZ9hXiu862OEirWczOjUniEDVtyF4
	xpQwpW3A==;
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=intel;
 t=1490691447; x=1522227447;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=qb65G4IKR2FSb7ziRqYw3hYHroiUqgJ+HMiWdWL5cBE=;
 b=iW8HuRDLz81aCgbImTdIM10xu+eOSMDoBW2CCDnv9eW9HkCSQmXf+9vA
 Q8zoYzNNiYiC9NpdtPYeYTFqX5auaw==;
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
 drivers/net/ethernet/mellanox/mlx4/srq.c | 8 ++++----
 include/linux/mlx4/device.h              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/srq.c b/drivers/net/ethernet/mellanox/mlx4/srq.c
index f44d089..3369f65 100644
--- a/drivers/net/ethernet/mellanox/mlx4/srq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/srq.c
@@ -49,7 +49,7 @@ void mlx4_srq_event(struct mlx4_dev *dev, u32 srqn, int event_type)
 	srq = radix_tree_lookup(&srq_table->tree, srqn & (dev->caps.num_srqs - 1));
 	rcu_read_unlock();
 	if (srq)
-		atomic_inc(&srq->refcount);
+		refcount_inc(&srq->refcount);
 	else {
 		mlx4_warn(dev, "Async event for bogus SRQ %08x\n", srqn);
 		return;
@@ -57,7 +57,7 @@ void mlx4_srq_event(struct mlx4_dev *dev, u32 srqn, int event_type)
 
 	srq->event(srq, event_type);
 
-	if (atomic_dec_and_test(&srq->refcount))
+	if (refcount_dec_and_test(&srq->refcount))
 		complete(&srq->free);
 }
 
@@ -203,7 +203,7 @@ int mlx4_srq_alloc(struct mlx4_dev *dev, u32 pdn, u32 cqn, u16 xrcd,
 	if (err)
 		goto err_radix;
 
-	atomic_set(&srq->refcount, 1);
+	refcount_set(&srq->refcount, 1);
 	init_completion(&srq->free);
 
 	return 0;
@@ -232,7 +232,7 @@ void mlx4_srq_free(struct mlx4_dev *dev, struct mlx4_srq *srq)
 	radix_tree_delete(&srq_table->tree, srq->srqn);
 	spin_unlock_irq(&srq_table->lock);
 
-	if (atomic_dec_and_test(&srq->refcount))
+	if (refcount_dec_and_test(&srq->refcount))
 		complete(&srq->free);
 	wait_for_completion(&srq->free);
 
diff --git a/include/linux/mlx4/device.h b/include/linux/mlx4/device.h
index 756ca22..8998807 100644
--- a/include/linux/mlx4/device.h
+++ b/include/linux/mlx4/device.h
@@ -766,7 +766,7 @@ struct mlx4_srq {
 	int			max_gs;
 	int			wqe_shift;
 
-	atomic_t		refcount;
+	refcount_t		refcount;
 	struct completion	free;
 };
 
-- 
2.7.4
