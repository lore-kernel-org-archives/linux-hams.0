Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7B369970
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214593; cv=none; b=DKaOEBWW1uUnk2BqnTvE7AuwZ8ycX6kHy/BFuqS+mekclkipxoMZwGIvLl4k84LSEhvZiuWZAKakMOByivoBbdTLkZM9gUMsDn7WikrwRPK4MiwM9grRx902N8hGvYWs8jcWPhEWvPpQmWdXlVKYtu/CB/dOM26c8pkbmxQbOtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214593; c=relaxed/simple;
	bh=iysh4N66Tl7xoc3UugBwoFjq1QevI5EVO8XIhrhB53g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UmVkT6h1C2DPLQfS3+IClfUYHHczd32Nw+Gx6lju0SgUw8Eq2CwU0hUXFU0QDkdgyjSiIfUbYfuSUGG9CPybN/vWMMzD5KjgkYjWY7Z/lO+nshZGTCy2S/JVmNXYKuMOk+wRdviA5zZzW7hXAVbKNm86C93jo6vWXZ3p/9462BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obqE+cH7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obqE+cH7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so55399005e9.1
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214590; x=1777819390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Crl6zSnTLgudSBuh74XMca0YFvGlbtRGkF7ktfLkgrk=;
        b=obqE+cH7zX34c6wxqY1F42KTEbdgiT7Q4ziQ0OQF+Drrl6+PJ2B1Hd7HUdDXgY81q4
         ONPmvosjoq3ZInACpPQw8vdfTp1E7J0R0v0P5jI0eFZ+JeJorEzHkTwlF4I+QhGMGnuq
         /rAtArnjL1WxfdNyGpHQKnrjUKAzS6w3tuSnR4tTs48dO5X8kSqN++gYAM3kXGuhEFYy
         iXsXFTqgSUrVP9idxn/A33GBfu3eoJ5Sohz6qrveH4MTw5Ro+76LGo0HQedZz7WPSQST
         e0SR5Oajupr/hWvA+E39O5gY7ZhZUYZ+B2kEWMCajOXF6I3T95WMxhGABCde03+FWs81
         DQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214590; x=1777819390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Crl6zSnTLgudSBuh74XMca0YFvGlbtRGkF7ktfLkgrk=;
        b=Elf1OnPN0VQB3hys9NZwc4VXLMvxeBwEpw6tZdb6gXwW96fNkV92FRkbGuFSICXsoZ
         ad0uKfS0Eh2VO0i4TZzIQf+P/tp1NISOLFl9dply8x8KGVuEjfrl6LODrty942aLJm0N
         uMpJPXhi1tvo8mbjFdvAHeZdr2BG12thw+DCL8XevrN3MQzYNqFKIZ31tv2w7RXzSWyz
         Vrq6qqE9PERSnCtdGWlFGUGpo4gFymeBVXPippEp3LBXEQpZApIdr2ZgHOdBsfT6yvKk
         SFw4QOzFcmovmRXrqDHv1nXya9n5fekzUcI+OXJNH/UXgPcZwR8XVb6QqFLC3r9M9Oo4
         YUsw==
X-Gm-Message-State: AOJu0YxZ7jrOPF2v65uoUVDj02VZ7x/arQEk2KfGXiL0YQjMu2emQcIB
	bjxakgYvjmRteSZynKVglSW5K1/Qnsp3r6D62/KqciqQL8mBZ5VUuzZj
X-Gm-Gg: AeBDievb8P2mlw8vladf4aN1X0q134lh5NzzEJmdtx6hgxpzQu5OfVmL40b/lXe3t3E
	5AZ1nkF/jo4YukgHs2Z1AUyeghZPWG3zPuNeiTZRfYLTKIog2Hai/ZjzRXUDz8RJ9OtnsxZ3pit
	oF4XJ4LaDePQTiBmYrIUI1tneaItv5JyqI8JCthZDCh6Xbkz19ax1Um5IolMaYH5jwnS+UuwYQQ
	+sHjOvAw1IqZVoFodlPOfE7kBfTdaCQeZTyl4VzF7+2bvYJOL29mYHeW+UNuH7zetAj3Td3zoSb
	MsJ1y6HGT+vlGX9ma7xR8iPmDWVJ2kzh/ifkG+c9mOP+/KDmv8ZDerFsSXo27dsmGAG25Ss/gAz
	ee1xGD36k6ihAccy76O0SMX4jWdxJo0oeJjwHgj1Lm1e+bH6OO8vRbdbToKu7N0yLENoTogKk96
	98dvjpyPfbVwHVfD5YQvzRfeAGiRqoUc/dJLRwpEqPrCJB0KUsdPNBi0kCo8HMUqDFC+KQlPrWF
	aWKM/kUzaSbRDsbQ3+2wzg7/w==
X-Received: by 2002:a05:600c:5254:b0:488:8bdd:cfcc with SMTP id 5b1f17b1804b1-488fb6e62a8mr600438295e9.0.1777214590130;
        Sun, 26 Apr 2026 07:43:10 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:43:09 -0700 (PDT)
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
Subject: [PATCH net 4/5] rose: clear neighbour pointer after rose_neigh_put() in state machines
Date: Sun, 26 Apr 2026 16:43:04 +0200
Message-ID: <20260426144305.984349-5-bernard.f6bvp@gmail.com>
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

After calling rose_neigh_put() in rose_state1_machine() through
rose_state5_machine(), rose->neighbour was left pointing at the
potentially freed neighbour structure.  A subsequent timer expiry or
concurrent teardown path could dereference the stale pointer, causing
a use-after-free.

Set rose->neighbour to NULL immediately after each rose_neigh_put()
call in the state machine functions.

Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")
Tested-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
Signed-off-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
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

