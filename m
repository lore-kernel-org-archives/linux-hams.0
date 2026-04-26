Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF75365A12
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214590; cv=none; b=ILPwsTu68j6YN2EnmOCyg7olfrk9Xv9syULJ34espS8DjsE/aGFm6me9+l6LO7HEAH40wdK1fAIXhBi01ylMkwezp0rkccA5FLlTt6yXHkr/vmVp1LSCo5sQJPVK4oz+ZSN6hBv9Fo6CksNkEaITu9OshNQqyeMnKVzoEQhouOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214590; c=relaxed/simple;
	bh=r6IW2Vxqif4eP3VQmis8+qHG2ez7xshZW7LUio3QdpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eh0NVB8RgyUBwt3pHrfop0B9GCkvgUEgz7poE7o7Dt+irFoyy/ZKRSdhp7+8HpUsUyVqq78JThVD5SsfXTCFHURJ1hRLX5MEnnZ59IhT+Q3yVulXyEs0zkQdlKDJx38FyFducti4x67TZ4qxTjN6xnO34wTgGVBVKi5DeOrgHVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLZgChtG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLZgChtG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so122193275e9.0
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214588; x=1777819388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9s1WYxPrrvK/oJoRsHuHHnoI8/Jk8XB2HAvh4QuaKcQ=;
        b=kLZgChtGfuoe/1fxADWQr+ppuBG7DmX7oteFEIwJ2kQFt0g9FTasPFEpkMVd12FB1p
         FGo+EWVzli5rhzCWArXoBgXMvSoR0MYk5IMAy7soAj5B0jeHQ2fVdy9q0JusJk0Lllp2
         3LVYyiuCr8+f9wgifaFQ0r3Q7FbOCzIFuce6t5eAn6u1XuYuV+0bqqWUmPbs3CEYIEnq
         83l3uhLtuwd6Nt8ImkVTKxlOExHgWuOyjSxCTEePMuDRzpbQl0CtJ2vauN5jn5hxxILs
         0GffxVEzUrB+z4WERTpFAHPKNE/yF85A6BTG9I3o+oG8ARKNmi2mGOp9cfdIMvs+OIq0
         PNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214588; x=1777819388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9s1WYxPrrvK/oJoRsHuHHnoI8/Jk8XB2HAvh4QuaKcQ=;
        b=eLiDGRDNQXO2F1VAr3WY1WbqqQ9ug2niPFW2VS7guc9Wv83mdcYPmgVG3RWo5yg5GX
         LpBRAFq2Nfh+kxXugM0NyMKEgT+TWtL5HTS9rx7JLgTmpTm5OGQZG5QIve9LoroRz/nS
         0ylG+IoDpWL8fJtrp7m1KM5/QdNTTD0YlT/ugehSFm5StstcZufXnagrmY5/MH9CkdGx
         zqX9OzYAlfUcj/X58pNhCparg2yVa70lA/fwN5qVMieKkh0i7mmihIQrFXOTTpT3IZaL
         aKmOfD7wDEz7HI1l/Nr2qvR6w4pLQoJ7PqaeZE+HNqah5mL6HrdLcD4Nh379n1LM2hLz
         SwUw==
X-Gm-Message-State: AOJu0YwgV4++JWyiyRQhL6oxJN/b04tDIk4hvXHa0+rTE6pLVs6n8htB
	jv2hgFrX5B02PoF0R4zUP8NpnyCsw8fKjudkDEx2I+L8tDrHdEY+P4du5eapYQ==
X-Gm-Gg: AeBDieugQGTahsjFXkAMRQbATTr1IPTLnNp995o3js1l4mdELKaNF+ZPPp9aaDHfRsh
	FEGk2k7/+b4Vp5HGpNDHftzQIrG6DAf3v2yAwK9FuutcZvo6txdr8HE0Q0m6o2oQRH873hFnkfi
	wHKIXCHLVIK+5bWlLVrkO8nQltKpNk6gP/AS6ZpFg9gVTbiHnnLwlXYSyBI0flnisPkKHhlx2I5
	JsIIaYpHbxHoT5xSp55LU47Mzti95EUjPrj6tTlIP7niXye00GkevUKcmat8U9KMBcSzWZFl2/H
	a0cf6FdQEwsTdEwC5IvKBKhSaN7VF8mI+OPg9yHGT0Qw030n9DposWC4yVyHIA373qGh+XDLuCD
	Z4vsPHaXnMwtbNYAj9fnjaJktbeOchvBQvaxUKuoPRxJ5UwUpMKWo/1yRVjMxycuTtWtxT2WsHl
	Rk9VGklVTENbkQ4FjsBebR33uzLniL9rK628NpAibrlQyuPENx+deSIWYZwP3hZw5Vsvum5abpe
	gvZnCOLCNpP2GM=
X-Received: by 2002:a05:600c:c10a:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-488fb771613mr428687215e9.18.1777214587716;
        Sun, 26 Apr 2026 07:43:07 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:43:07 -0700 (PDT)
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
Subject: [PATCH net 1/5] rose: fix dev_put() leak in rose_loopback_timer()
Date: Sun, 26 Apr 2026 16:43:01 +0200
Message-ID: <20260426144305.984349-2-bernard.f6bvp@gmail.com>
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

rose_rx_call_request() always consumes or returns the skb but never
releases the device reference obtained from rose_dev_get().  When
rose_rx_call_request() succeeds (returns non-zero) dev_put() was never
called, leaking one reference per loopback CALL_REQUEST.

Move dev_put() outside the conditional so it is called unconditionally
after rose_rx_call_request() in all cases.

Also remove the dead check (!rose_loopback_neigh->dev &&
!rose_loopback_neigh->loopback) that immediately precedes it: the
loopback neighbour always has loopback=1 so this condition can never
be true.

Fixes: 0453c6824595 ("net/rose: fix unbound loop in rose_loopback_timer()")
Tested-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
Signed-off-by: Bernard Pidoux <bernard.f6bvp@gmail.com>
---
 net/rose/rose_loopback.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/net/rose/rose_loopback.c b/net/rose/rose_loopback.c
index b538e39b3df5..914c8f453a1d 100644
--- a/net/rose/rose_loopback.c
+++ b/net/rose/rose_loopback.c
@@ -96,22 +96,15 @@ static void rose_loopback_timer(struct timer_list *unused)
 		}
 
 		if (frametype == ROSE_CALL_REQUEST) {
-			if (!rose_loopback_neigh->dev &&
-			    !rose_loopback_neigh->loopback) {
-				kfree_skb(skb);
-				continue;
-			}
-
 			dev = rose_dev_get(dest);
 			if (!dev) {
 				kfree_skb(skb);
 				continue;
 			}
 
-			if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0) {
-				dev_put(dev);
+			if (rose_rx_call_request(skb, dev, rose_loopback_neigh, lci_o) == 0)
 				kfree_skb(skb);
-			}
+			dev_put(dev);
 		} else {
 			kfree_skb(skb);
 		}
-- 
2.51.0

