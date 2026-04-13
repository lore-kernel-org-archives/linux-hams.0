Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47736EA99
	for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776102164; cv=none; b=keAscpJFH6CBvlcG4Vl4vhEnza8yXvygS0b5NdrLX4XW4dYXWEcdQAZXvNQqLPuzZ7/bksUR8ITwTzbBHYfxx9Ra5UepQ/53TUzxMythvulDWxHmdLwCYWUQ+qev5U/NxisYPKwByMUTcebQcFd9z8p6wwuDcPHb+b1P3gfAJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776102164; c=relaxed/simple;
	bh=Okef0H2XLoZJimTraD01KekCXXBRlhJ2gzRinkt+xaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOUPKK93BHC9g71tzA4VLd6qtivme7/zN5uGgzxD3WuUCqOxbW4YLlcIqvqbKDLh3XEm2Eb8MrF27JU24oIyeyFv5KQNVaKBjo2HZCrRJz+sitn/h0MrckO5IszakiyRqmvVHVXNwRSZHyEzk8/mgkhDQTdqDhV89mkD//yc8lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzm7dxKQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzm7dxKQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so33619525e9.3
        for <linux-hams@vger.kernel.org>; Mon, 13 Apr 2026 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776102161; x=1776706961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLuKmq5rQDVkM792bx4uWTtwIM6ABqltLpbUK7BkPSw=;
        b=jzm7dxKQ/ZtcJkM/Gv+Z+Gc0M1uqVN9SloWTfzrdZrq8j37t8MgIRF6l22Q+cYLQGb
         zGQanMTBKypJcrLcjk40YOvogAMEeC5/Wn8WXH7cYwEte3c7oobzwUomdLClwRYDLWs4
         oTAGTKAWfVbYWC0XgK+wH2+Y6O5rX1rkYDr8Lft3VPiUNnalWNkK2dweWi5eDq7isB4x
         eW9PXhE8Sl3IfkIT3tCwbfFxUL6k6bw4WkdA8+u5CI4M5496hHMzjjY90pmqxlmrjzo3
         AGrn8bAITZ3v6TANZETszCTS3cCfka+fKY2FXrsUEvQHRGaoV4b1ouAd3K/7yiJNuVqC
         Vrpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776102161; x=1776706961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nLuKmq5rQDVkM792bx4uWTtwIM6ABqltLpbUK7BkPSw=;
        b=lGX923gxd/hN6H5LzI2MntKJAgQkAB/GZzaBhQBX+kKpEB/UgOANO2QlKdXmwPiNPo
         v/C64VbVaTm9/tTEsHOCGzU87D9PEKP4jy9g6UoF7sS2f6rugPiDMsy96rHBwmG/T2NB
         yh8jaXMzeExS1/dj+ZZYXXaBglCwg89jtQ55e3KJwCMM9l1+opfIone/WoDYKI05/eoV
         wM5CWQEW1p2g/Y+BkZE24gOTgdTFBLu/DjXDLdujNGK+fEckX6CH6gTj5wKV0och4+ML
         rxea2Mv8oL+Ce/XOrDW9zk0rX0s96TdTbiqFSk2wW1B3f8+o+fJcl9b/d0At8qWlAViC
         nENQ==
X-Gm-Message-State: AOJu0YxunHxmeXi7jUUw20ea0BjoiuwCYN1kjcEmHCfJ4qnkCBlDoVMB
	rIt4sEVq0aErOYQGfhO3nsJQKbE7Tn8YpeU7G17Iz9Vw31Q7z4ZLklUXiAAHP+Ls
X-Gm-Gg: AeBDies7FD3iIw4uRhznmRvkH+oufu4QGUMxMO7NkNsNeEvnwmFPjH4L32Vf6/XeHHq
	x8OsPgvDODxtjXRLI7rjhN7BnjkeyzkG6iz10y+69DPgt1UwyLzcT4RcsH1dOlUu6C+JeyPM+x+
	oPGWwNPEdn/PneMet6NZyplY6MXvRTOQYJPn4nS7ZtL3FIksvw34molezW/3ookg9LzjYHDMdVb
	0GGy5i4LkwrDGsB3tHw22F4BUcCz9rpnXk849zUIBs4GK54KdcWghk+DyGcOWieKg6qnMHptHrw
	LheBqUDQQhhayESdUcykAXhJPH73fFWu0e8WtlukK72xBlR/jDXYPVjSTp70U910O5C48jQlVog
	cCsfanp0FLaz25oHjpVDbz+y236btYijT4EmCox5Bo7ybC/pUOEH4SlXqzOJY7AMnwEdHpV8t5A
	t0qaYUsDWuRteQQBaL6/tkthG2xzzmiOGMdnH5M3SqZ3Q/r6k4nYk9ejUyx2e0qLhYSaV21g0pm
	Bhn
X-Received: by 2002:a05:600c:3107:b0:488:8b52:f7de with SMTP id 5b1f17b1804b1-488d6860930mr176985285e9.12.1776102161213;
        Mon, 13 Apr 2026 10:42:41 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e50200sm34922778f8f.29.2026.04.13.10.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 10:42:40 -0700 (PDT)
From: f6bvp <bernard.f6bvp@gmail.com>
To: linux-hams@vger.kernel.org
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	f6bvp <bernard.f6bvp@gmail.com>
Subject: [PATCH net-next 2/3] rose: clear neighbour pointer after rose_neigh_put() in state machines
Date: Mon, 13 Apr 2026 19:42:37 +0200
Message-ID: <20260413174238.112418-2-bernard.f6bvp@gmail.com>
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

After releasing a neighbour reference with rose_neigh_put() in the
ROSE state machines, the pointer in rose_sock was left dangling.
A subsequent code path could dereference the freed neighbour, causing
a use-after-free.

Set rose->neighbour to NULL immediately after each rose_neigh_put()
call in rose_state1_machine() through rose_state5_machine().

Signed-off-by: f6bvp <bernard.f6bvp@gmail.com>
---
 net/rose/rose_in.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/rose/rose_in.c b/net/rose/rose_in.c
index 0276b393f0e5..622527f1354f 100644
--- a/net/rose/rose_in.c
+++ b/net/rose/rose_in.c
@@ -57,6 +57,7 @@ static int rose_state1_machine(struct sock *sk, struct sk_buff *skb, int framety
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, ECONNREFUSED, skb->data[3], skb->data[4]);
 		rose_neigh_put(rose->neighbour);
+		rose->neighbour = NULL;
 		break;
 
 	default:
@@ -80,11 +81,13 @@ static int rose_state2_machine(struct sock *sk, struct sk_buff *skb, int framety
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
 		rose_neigh_put(rose->neighbour);
+		rose->neighbour = NULL;
 		break;
 
 	case ROSE_CLEAR_CONFIRMATION:
 		rose_disconnect(sk, 0, -1, -1);
 		rose_neigh_put(rose->neighbour);
+		rose->neighbour = NULL;
 		break;
 
 	default:
@@ -122,6 +125,7 @@ static int rose_state3_machine(struct sock *sk, struct sk_buff *skb, int framety
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
 		rose_neigh_put(rose->neighbour);
+		rose->neighbour = NULL;
 		break;
 
 	case ROSE_RR:
@@ -235,6 +239,7 @@ static int rose_state4_machine(struct sock *sk, struct sk_buff *skb, int framety
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
 		rose_neigh_put(rose->neighbour);
+		rose->neighbour = NULL;
 		break;
 
 	default:
@@ -255,6 +260,7 @@ static int rose_state5_machine(struct sock *sk, struct sk_buff *skb, int framety
 		rose_write_internal(sk, ROSE_CLEAR_CONFIRMATION);
 		rose_disconnect(sk, 0, skb->data[3], skb->data[4]);
 		rose_neigh_put(rose_sk(sk)->neighbour);
+		rose_sk(sk)->neighbour = NULL;
 	}
 
 	return 0;
-- 
2.51.0

