Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2595366DD3
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214592; cv=none; b=NJSX6WuPqxsg07Vz6GF2wxLskvsBc2qCeMEQr4H4OItigEGLHlBzeowqKDV/cY8pZq8qtAEie887JtEskoF3DmWT2nZVUnbHdRMb3t97aUIYNaWipk+fgRJdcAcGlRfC4qvEAmN4HQcIgxkno+qFpLF5yWa0iGuFWqZCYNBppgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214592; c=relaxed/simple;
	bh=Re4gp72M+Kx1ob9peixynICA2ch+YUmknvJWbzp+frY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/5ROgGm1xVc8J3q7eR2qnfPC1h0/GlHQjTP1Ml0cNQzWkvt+fOyGwJBXdZpTwrAnTSDzyibGF42nwzUeNCtcrLj4oDJfSmoIrTNjyKYkXJa5H8Vz0l0eLqwAzf7ZS49oKkN7r8E9VVivU2ihE+Jj1aeBHcusnBE9n51nZAPIcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfRKprcb; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfRKprcb"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so110017685e9.0
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214589; x=1777819389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skBBZ9ixztfRWmWoAATqpN2NCAoakIzBp3aEndiAumw=;
        b=QfRKprcbzK2Z6Y18O2XVMC12KR8QL0tSoJVegEVPQhh4RCRwH7e6mQiaLGq7LWqWOU
         k257hSI/iYx48pCuhPM+XGC2LBhwu8ZPlawhXnWamHoXUfjhrlfIRCOuqq9O5xdgfQgR
         sPYVBvlsznoAHhQitUMt0iNv/BfIEBJsdQSSxJnVIbM8ROnOZru4aXuXNBfq9dQEHgzx
         p6XGnNrQT/VJcD1F/owWU99NFMPO3XZtBi9NpcjhER4ucN+o1K/ete/sLfC9C8/QtNCS
         V1WSjCdjUnqABrwe0AT71Af1MAuGYuADeFBbCLR5i9vIW/2h0nR4d3ZDTx/i7SVonVW8
         xuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214589; x=1777819389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skBBZ9ixztfRWmWoAATqpN2NCAoakIzBp3aEndiAumw=;
        b=jOo4FmvW00h6Sv7QU6//V/r+zb/9keJdnbf+nrkGUEQlvBMhnbUsn/zEXAgBo2cYSG
         4rPuk2Pq8dgQozQNYfsD5ObwaUPPlibx0A9hQBigakcUVMiSG9xJdY40m+vnDNd7H4UD
         hNK+OlBEqx9wBjVMPHOTJHTFH8yMcW6qjRCuENjs43AnOXRUrAodhQXwlRzE3ULypn/O
         PfQAzSpC+ttPJzO+D/d0vFHy+OfVVZh/OuptxVSQNBAlkUu0VzuQ0WgvdtEmZonGH+ma
         gHAM2X9/7KOSDUxybpNJ5j+zQGcOYXKi5COZQ1wiXBRF0hUf10Sd5PkrNY08I4ZxJ1e7
         R79A==
X-Gm-Message-State: AOJu0YxJp3yRtxzKp7o4kx2bu4kf0HsCKEYBqVLYhDsU3lZ2G5VPBfkA
	aRQP2ZKvWszCEIvmD1wCFc705JCUdzbizdtvPzH80SO/N8hguuP3jyZqxkfy6Q==
X-Gm-Gg: AeBDieuKdFTyt08bh/wlQ6BBCRNPosq4W2JRjNAtBSbWouZyhj9De9ZDJpBzH5Hg/5e
	daabsqwW2cFCsYUCNrxRP68CsuEA/yBu7lvWQ149p9yzcAZutvyI7iwuJBmfwVvejljuPEP7MIr
	z3rMUwAjzpb+eOqGeQfg6nNyCKEbbFR/k8hi094klXYZuFMV8NlEIj+d216Q+1ky09qaD8Luh8v
	xfWV1D2j1qJ9HYC+VYu/5bnz8ZxDwK1uUBoE075J8cKhEq+O55ykhS8t7eY9SyRCOr1P8wtdyhH
	TWOKsVu4hTRB+rGPFqmaEvHEzKo3p6ThyNDv8FQMr0jmo4t1C/rUjt5hBvIMd1kuX57XHKdA/DR
	ffW6AzYqJqmSoLMlm+OfF5SXQRGhI6x62nHn4w+hGLBHV5bHJ1RJLw2Y5z9T0vsyZn2YjgPK6O3
	20Pe8dmeqgWvtUHA1PwE9qjdK0bXEqK6XxQxHa8NP8+lhQDgb+xq6MNB2D64zFPCx9f0clKxqDN
	p6lhMxitprdg7s=
X-Received: by 2002:a05:600c:a416:b0:488:e7e4:8425 with SMTP id 5b1f17b1804b1-488fb787674mr447887245e9.23.1777214589232;
        Sun, 26 Apr 2026 07:43:09 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:43:08 -0700 (PDT)
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Bernard Pidoux <bernard.f6bvp@gmail.com>
Subject: [PATCH net 3/5] rose: fix race between loopback timer and module removal
Date: Sun, 26 Apr 2026 16:43:03 +0200
Message-ID: <20260426144305.984349-4-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260426144305.984349-1-bernard.f6bvp@gmail.com>
References: <20260426144305.984349-1-bernard.f6bvp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rose_loopback_clear() called timer_delete() which returns immediately
without waiting for any running callback to complete.  If the timer
fired concurrently with module removal, rose_loopback_timer() could
re-arm the timer after timer_delete() returned and then access
rose_loopback_neigh after it was freed.

Two complementary changes close the race:

1. Add a loopback_stopping atomic flag.  rose_loopback_timer() checks
   it at entry (before acquiring a reference) and again inside the
   loop; when set it drains the queue and exits without re-arming the
   timer.

2. Switch rose_loopback_clear() to timer_delete_sync() so it blocks
   until any in-flight callback has returned before freeing resources.

The smp_mb() between setting the flag and calling timer_delete_sync()
ensures the flag is visible to any callback that is about to run.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
Signed-off-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
---
 net/rose/rose_loopback.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index d66913df360d..80d7879ef36a 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -12,13 +12,15 @@
 #include <net/rose.h>
 #include <linux/init.h>
 
-static struct sk_buff_head loopback_queue;
 #define ROSE_LOOPBACK_LIMIT 1000
-static struct timer_list loopback_timer;
 
+static struct timer_list loopback_timer;
+static struct sk_buff_head loopback_queue;
 static void rose_set_loopback_timer(void);
 static void rose_loopback_timer(struct timer_list *unused);
 
+static atomic_t loopback_stopping = ATOMIC_INIT(0);
+
 void rose_loopback_init(void)
 {
 	skb_queue_head_init(&loopback_queue);
@@ -66,6 +68,9 @@ static void rose_loopback_timer(struct timer_list *unused)
 	unsigned int lci_i, lci_o;
 	int count;
 
+	if (atomic_read(&loopback_stopping))
+		return;
+
 	if (rose_loopback_neigh)
 		rose_neigh_hold(rose_loopback_neigh);
 	else
@@ -75,6 +80,13 @@ static void rose_loopback_timer(struct timer_list *unused)
 		skb = skb_dequeue(&loopback_queue);
 		if (!skb)
 			goto out;
+
+		if (atomic_read(&loopback_stopping)) {
+			kfree_skb(skb);
+			skb_queue_purge(&loopback_queue);
+			goto out;
+		}
+
 		if (skb->len < ROSE_MIN_LEN) {
 			kfree_skb(skb);
 			continue;
@@ -118,7 +130,7 @@ static void rose_loopback_timer(struct timer_list *unused)
 out:
 	rose_neigh_put(rose_loopback_neigh);
 
-	if (!skb_queue_empty(&loopback_queue))
+	if (!atomic_read(&loopback_stopping) && !skb_queue_empty(&loopback_queue))
 		mod_timer(&loopback_timer, jiffies + 1);
 }
 
@@ -126,10 +138,15 @@ void __exit rose_loopback_clear(void)
 {
 	struct sk_buff *skb;
 
-	timer_delete(&loopback_timer);
+	atomic_set(&loopback_stopping, 1);
+	/* Pairs with atomic_read() in rose_loopback_timer(): ensure the
+	 * stopping flag is visible before we cancel, so a concurrent
+	 * callback aborts its loop early rather than re-arming the timer.
+	 */
+	smp_mb();
+
+	timer_delete_sync(&loopback_timer);
 
-	while ((skb = skb_dequeue(&loopback_queue)) != NULL) {
-		skb->sk = NULL;
+	while ((skb = skb_dequeue(&loopback_queue)) != NULL)
 		kfree_skb(skb);
-	}
 }
-- 
2.51.0

