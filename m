Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C136606C
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214591; cv=none; b=linxYhK63ecDdwGC+n3SopBpfMu3R03MVcuyIUm2JiS+R7JZ13y78gfYTcF6rn7bd5GmcX2ZqtSuOVbBmnQiI+IPHKbnZqM6disTc6LTDoE7BbrqyRxeSJstq1Fw0HDrGP4G/ppN2qRvX0vNc11Hedf573FqnPW15ZcNK3QruSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214591; c=relaxed/simple;
	bh=GTNaJU5rfiK/7CNFGset7McFd/fW6p7Tcwie3dvvoTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImoBt2epjuJKZgTOOgbgpU9s9OMa3WNMFuDkUgrDMEwSIP+AhNPG25aadJr8YRYVL8rTCD2qCNQ54o10TxFvTEnuYvkvEMKMb/2MDenWrs1p3c5v8lomDU/w4YR46jQO703IixXdWmJUomKuqKnKWUlrxWHWIOqEI++0Y2rTZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3AqaEBx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3AqaEBx"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488d2079582so110010595e9.2
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214589; x=1777819389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2KpsmARPAtRSvoDa9ymJ5i0W11MeQfCElgcBQa+2W2k=;
        b=D3AqaEBxrIgQBPDf2orZ4mLmKmnzyer1H6/PBz8GoahCZHrkm9i201Fe/gpunZ7Gf5
         suqIcZwmT07Z5Jg5pH/VpelOrgnw51964yiXFNV2jNBBxAUtm2iYms4uigklXOG5fgVX
         11Aar0tIoMAkyl0+cKCRQr/e/BumPBEsEhbq2o7fpF3dGJnglcojHONwzsW26BHl2bMo
         qSkEJdAPBqrdxh3UmjMcNzZpNvRokXQ8fSUsTR3D6P1jiFN7VKAzAeJNG+kAu6SzdJ/W
         NqmjfmcpZnJjaW53FYtN4q+F2GB0S9SJ7SIDDpCphRJzMlPg4bUu4vy8hETUKaLpx+Yk
         mQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214589; x=1777819389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2KpsmARPAtRSvoDa9ymJ5i0W11MeQfCElgcBQa+2W2k=;
        b=R/oQ1b1GF7pDGaxX11gmwhXKXpVRH/fRLqEDW1YPcG0a3YWOz9aMo0PgHxfVEqv2Yv
         Q3QqU/Bq2g+VGw0KxcBzYnKaMSHEqWcQk1T8r401KDeA8swHR8kiDgM7ctOQ5CWm6e/F
         D4vAKMwvt+6eF7Pxa9H7HbKdny1Gi5TRaRJld5wngCjgoMyZDkn9hujZIxwKOCmV7Mqo
         AzYzUp/2q+8xx1O704ERvdsJJjcnitTD8E9YtO9ZbLZ3xy0IVi53gxfwC1GdAFgtw5Lc
         ibLYLUNwXNJCQsDug5C7vLjsxNT0qatusTE7FcJkBDuOfLTe657Auvi9Nq+mP9DjSn7q
         VKRQ==
X-Gm-Message-State: AOJu0Yx7+NTzA+SDk2foD0VC3Me+sotJwURPb5CMN2Oe+KRnMY0ITBMQ
	D5AhCfbCMptOgEZxBzmUTurEumE5UrgadL5MubhkxQBEHgJqJnNQN9J7
X-Gm-Gg: AeBDietbyYiUNq5gnW/u9qo+80V2SfaMSrTSeeNvR+AJD9SI2T3R90BcBnw+68uTkVq
	kVWZX3Ocg/W2Fh4cQUBbtF5IRVNroDncVJIt/vSRbQ/ruwNoAelVtOqO83iF2wMm5/ihi8Jmgeo
	gUbB1SUaJBKJseJCSg8slzOFHVMdPq5+8J4vI+xTOE3bmGGFGmlLj9wbQyFcS+YJgybOLIW3It5
	MvHZ1nRFeZktRrXH0hgCrd5lZvrgJ+D7q3Cf9NbqItLTDYsGut0fPdndBbX/mIsiZFVldJY4lXU
	Gp8dt5+LHJm6wxJtBTNWdSfcFdAbdaBVDczM9V/E2NNg8Iee+wHN/JJ8QDRkkdC0ake9GDveT8K
	ioySCyMGjoQ0Jlj9bfKyS8/WbLlNSK5nTZZZzQvE7unwVE2wctxzETfMvvyCim184XT5lIn/qoZ
	G3FBpIwlnNkmYhS1hU4PiyPUiEH4gzT6hGUdxnbJYJbnSbofZFKCiDxffyp+ZSeC43awwOE1SyP
	LRqSFpSJ9RDhPk=
X-Received: by 2002:a05:600c:3515:b0:488:8b99:54a1 with SMTP id 5b1f17b1804b1-488fb78e7c5mr542589465e9.28.1777214588545;
        Sun, 26 Apr 2026 07:43:08 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.07
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
Subject: [PATCH net 2/5] rose: hold loopback neighbour reference across timer callback
Date: Sun, 26 Apr 2026 16:43:02 +0200
Message-ID: <20260426144305.984349-3-bernard.f6bvp@gmail.com>
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

rose_loopback_timer() dereferences rose_loopback_neigh throughout its
body but holds no reference on it.  A concurrent rose_loopback_clear()
followed by rose_add_loopback_neigh() could free and reallocate the
neighbour while the timer body is running, causing a use-after-free.

Take a reference with rose_neigh_hold() at the start of the callback
(bailing out if the pointer is already NULL) and release it with
rose_neigh_put() at the single exit point.  The neigh cannot be freed
while the callback holds a reference.

Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
Tested-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
Signed-off-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
---
 net/rose/rose_loopback.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index 914c8f453a1d..d66913df360d 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -66,10 +66,15 @@ static void rose_loopback_timer(struct timer_list *unused)
 	unsigned int lci_i, lci_o;
 	int count;
 
+	if (rose_loopback_neigh)
+		rose_neigh_hold(rose_loopback_neigh);
+	else
+		return;
+
 	for (count = 0; count < ROSE_LOOPBACK_LIMIT; count++) {
 		skb = skb_dequeue(&loopback_queue);
 		if (!skb)
-			return;
+			goto out;
 		if (skb->len < ROSE_MIN_LEN) {
 			kfree_skb(skb);
 			continue;
@@ -109,6 +114,10 @@ static void rose_loopback_timer(struct timer_list *unused)
 			kfree_skb(skb);
 		}
 	}
+
+out:
+	rose_neigh_put(rose_loopback_neigh);
+
 	if (!skb_queue_empty(&loopback_queue))
 		mod_timer(&loopback_timer, jiffies + 1);
 }
-- 
2.51.0

