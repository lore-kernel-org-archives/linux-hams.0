Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254D7376BF1
	for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102165; cv=none; b=qgARYVO+OgewSl1EwUZvShzmJ/ZvBRFLH/hW6OasAXcMi3fmkUzjfOoHPxyoHthJ2dYR9Z4dWDJ+wBStRfBhOwdxIHtmloetHUnGjfiG++2AXykMYQ47ZecVisCmqSYMUxs+Z8bwsl1QNrruu2aBwyfNKDRSeVQ5YI1Y+JN1hX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102165; c=relaxed/simple;
	bh=pdoX2MLEvejM5bPSuGFepVTuhjVGnBZH2TLsHDge3VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5wS9r3UdV6H526OA+coBFNfXMbc962vZ+TDInZH3xxBA5F3ZPgflSWjhaG+34KVaN85lzZ1srO1AY19HxLQgFJQ5iC0w3zoQ8G1//xwPaCGjNy/pR64+NvLwC0lgfn4QxPp6kYcKdfWpXcI1vXvLjI55HRBn2mx246sgAbDN1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG7J4EKO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG7J4EKO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a29e6110so51645045e9.3
        for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776102162; x=1776706962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncBfyn7ZmgBmJPdYm4Jd+RScDpN642VH/yxjfU7zB0Y=;
        b=SG7J4EKOouJFzn5JI2k+Nl7m4iRsUz/Sa4hx+RRPL2lmuVE0xIhf9jcuVuUaa+VPEM
         96eugj0FDb46JyxtRe3b/JPE4sdJu3uZc+Pfy/gylBtGQQZx6C+qiPbl+E2rnhD5TcyE
         d0gbYBlQUNuvb9kRQ7BBY50lPaearlL9f4Yiln7WOpU4GbjJOMmvOSGNmh5sYOsxRk39
         +9+pEXWeGAbZ2Y3ZJ7+8zan8kmVCezSnnzUxJWZnUluTwgxeXVm2L5ZdxxNMtQWWUZ9q
         rXq2+QC7XcaROznP7KK8oNBlLekLjpILk89OhT2eHOq7jx8LQ0EVMNE8poP40y6Tb+nf
         HVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102162; x=1776706962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncBfyn7ZmgBmJPdYm4Jd+RScDpN642VH/yxjfU7zB0Y=;
        b=FQDaQNacUOezVYVDGPQUg83OBiyin+Cl5WX6t6lgBJnGKuj+MLJsSqDoSqwQsSYiGp
         0M59WWr+q9Fvc35/o6k+gHPVW2pn+TqFkuWNcrGSAM+quzH0lOCqP+KfqTXVA3ah1Rmw
         /vs7GUrcIhjKQz+CbP7OWrbG+rCwKW8HJMYY+O1EW5ut8/J9Yj5fNF/wxGoLtE7oclhK
         Mtw5b+vsRITWpCRNmob6e8hrH23WBY8RuLzctnxQlp4W+P6PTqkCZh1p4/Pvjvsybg/B
         jWzznFWw1i2qcBiNb1k8mvS5UKyrRK1zAeNhhL38jh28qseZoEvkRuLy/3Rej7fimpbx
         YNTw==
X-Gm-Message-State: AOJu0YxkaWrslxeeXSaVlEOFoD6UoM/CY40wytmXUcdiiXfnhcR+1gOZ
	2dNEoKYlXlYEiZy+zfZLA4gJ3uNUtpHzxwtrW1KOSq7AH97l5shg/YjvOk620OyW
X-Gm-Gg: AeBDieuyYnuIqXTfPWptN01lGbK248YvYYYAD+2TW5/67QBxZwIcKijuIb1LzwkNZCm
	jljnKwgrdj2Hqwwu0fBWcODwtar5TdCc2nOql3Qx5nCSXYpLSmWkARtZT6NtPcNJLi6NfdrR99f
	HTgqMgRZDM3h3cSa4tPxKrl1dY6A6QWBkKMXwGg8CRvkxGcoz1YHd5G4IwjvU7eOexR8yZ2h+8U
	dFiIM4e4hoikoI2AZdRXpDVlVogE76KqBwEkzH0p2SnGyyJWerxXUOJb+0r63tnBFZbky/lkkst
	JaZPqplFhvgxkjf5p5AlGEDvNk97eKH299P/LD0RitBqeEaXvqQWVKIe8rHAU6GjpmmHhc77ZCi
	yu90Jd0kcRY+R2v66rY7auXh/DeeGCKvWT/yZ2dXjyF0gQCqwgFt70q2f2Gl/vJ3LN0pNM0p4e+
	05pzFKncuBi3cEyJSGAPQ1miirWRUH5omkGsvr1ATvwSH6bNMxKPHGuLklDrmI74NnbKkjK72Ab
	qeC
X-Received: by 2002:a05:600c:8883:b0:488:869c:eda4 with SMTP id 5b1f17b1804b1-488d689b4edmr142634005e9.21.1776102162312;
        Mon, 13 Apr 2026 10:42:42 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50200sm34922778f8f.29.2026.04.13.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:42:41 -0700 (PDT)
From: f6bvp <bernard.f6bvp@gmail.com>
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	f6bvp <bernard.f6bvp@gmail.com>
Subject: [PATCH net-next 3/3] rose: guard rose_neigh_put() against NULL in timer expiry
Date: Mon, 13 Apr 2026 19:42:38 +0200
Message-ID: <20260413174238.112418-3-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260413174238.112418-1-bernard.f6bvp@gmail.com>
References: <5a88b747-bb06-4ebd-99de-80ceb574cf22@free.fr>
 <20260413174238.112418-1-bernard.f6bvp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rose_timer_expiry(), ROSE_STATE_2 calls rose_neigh_put() on
rose->neighbour without checking whether it is NULL first.  The pointer
can be NULL if the connection was already being torn down by a
concurrent code path (e.g. rose_kill_by_neigh()), leading to a
NULL-pointer dereference.

Add a NULL check before the put and clear the pointer afterwards.

Signed-off-by: f6bvp <bernard.f6bvp@gmail.com>
---
 net/rose/rose_timer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/rose/rose_timer.c b/net/rose/rose_timer.c
index bb60a1654d61..d997d24ab081 100644
--- a/net/rose/rose_timer.c
+++ b/net/rose/rose_timer.c
@@ -180,7 +180,10 @@ static void rose_timer_expiry(struct timer_list *t)
 		break;
 
 	case ROSE_STATE_2:	/* T3 */
-		rose_neigh_put(rose->neighbour);
+		if (rose->neighbour) {
+			rose_neigh_put(rose->neighbour);
+			rose->neighbour = NULL;
+		}
 		rose_disconnect(sk, ETIMEDOUT, -1, -1);
 		break;
 
-- 
2.51.0

