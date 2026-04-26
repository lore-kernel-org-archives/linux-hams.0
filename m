Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C67345CA1
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214590; cv=none; b=KAirna+34Y1LBMb4XgogyxZA2DTkfIfBxZmbapBtVzhwWNLskC2tDMC/jeQ7jbv6DE9nSXphVaVJX9m8G2ygcp0QF2/KQ1CsqbmyGRo5SSQENrL9qM0CXXCRDRxzS6xB6Qg42SaHYHDO67L+w3VTqAQ95tXG0POzVvqCUPPzoqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214590; c=relaxed/simple;
	bh=BkKTDP/QdqV60QGLaKXzoX1Zq58loiHiNgpiGqts+0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHmhn3AfFaKp4n0EupWypPBOZb/l8P52HgaTc73CxFYXFrQYg1dXxLKMU8jXYLkTDv7ah0v9kGlhYzKeFQRaa2H31LzeJfCKpu0tEusOhyut45MHSQM0idls2uwHLIzFxnUOwN4I7jLzmC7psMGUaUO10VIqePdCTTEPs4Mihq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkcWGcvL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkcWGcvL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso131925305e9.3
        for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777214587; x=1777819387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N+fDrQ0imKcqjUd0pDltukSNKPmoj5xTHANz+kyGdM0=;
        b=jkcWGcvLacvY1y6WGFllv6v7k7ED4TRa3i14ALbEC7TghNb9zGdC71BMTJRy9//uvO
         llYPnBZrm0G7mQbNm/Hv9kF0XDnBEra8D+rHbanRqd68LyB13ee37r2bKC14XdLJX/51
         EcgKC2RQvE1H8p6pSbepiP4f288z5BWzpJxNKwb+VbrqFys4xF94nK1F7u9D93FpIPaG
         M1LeienPJrW+cKp2OTPDoVEmQ2fWM7vvkI9jXgxGg9a+SY+AohMYNW/Pui+fWbJcxGXZ
         5Yq8ovY9UKJHEwdsL9Kbznz1imtVkYkGqvycEuP3jAjoKNTTodjd0GaNQzAxR8ZhBVlr
         QBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214587; x=1777819387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+fDrQ0imKcqjUd0pDltukSNKPmoj5xTHANz+kyGdM0=;
        b=bxH01++t8JUEAsF+OidFoAsKCkNbBetmzqGsPC+UKTR316NxJOvkZ3WgPxynGQZNZN
         yxtDnkaOregntKI0c6AaXwBx4dfE4YqJgCZf89G8LTHBsrWdqblbPx+Hg2lRCRK53/Wq
         nDPtok3NXNHoOccdatR9T/2luAT151OkISElHkWLcQrzwPQMUIyYVPawBjqKXsoaLZqw
         ZhTy21Wz3r6mJuNYvEZxhLU5PF/BEYOXsJ/q50Kf1onQRQRV5kncikjrf1aL567oZyxp
         5GBCe5Hoj2AWE/AUX1BtqZLt0BdIW4hDNeLlzRgubrq8T8OcVoHyidTW8lsZXdWMrTf7
         3W+A==
X-Gm-Message-State: AOJu0YwaDGVUNzeHT+t65egXOCm2u2HBK2uG2UU6HZsFxmFHx1KvOAi+
	Qfjl+ilAxqGbzuoBrc9BMRPdHB8vnKJ1UrbX/0C3F81wFzrSBIf7LLJQ
X-Gm-Gg: AeBDieuSVozyrKVBP8NCFSEwyV6sGsgAj+XqlH7fnYRVIT6obMl4+FAELVbXyNbGOHx
	dreIptrZxZFjFUR0lfjDWALTZ+C3EZgrS4bkr+zdLv7nuU4M62mRRzFLrfu+LHuIoGdlnmQZa6N
	reX44yoB8sbVf5rj2cA35eEyu0fXMDxZH4p8LntVo0izvm0/UFNKakbEaPGIZs/QvmposdoVuV0
	KQrTOdXQO+l1CqiwxJvEgpLPv7w8ZlZAu6yl37jdNbvgssJSefox/XfI3IWJ7ZuhthUG6OVg8OL
	sElyeDq7wqN0zr+4J+i2yOEe85EUyiDZyLZbz2CSW3oEeopy1n6TUzoh0t0SfEyd5IuhzvCE6Kr
	sjKHm0fWHMrKNsKAAOz3pVhRw77GB7IQRycuRF8Eq6+hwUEh7+DDfUGKmGK0ovR9/LNqMIExo4Y
	Yuhq11i995hsn0ZSvn9j12DtW8UkOfurZ0rgpN9cf39LjxgOVLc/YTLjYMcUKHbseIYyzfO0uMg
	NxYei5TC6+v1NK+JWaboaXoeA==
X-Received: by 2002:a05:600c:308a:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-4896c22e217mr277337225e9.0.1777214586995;
        Sun, 26 Apr 2026 07:43:06 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-366-193.w86-195.abo.wanadoo.fr. [86.195.82.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc18bccfsm658230335e9.8.2026.04.26.07.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:43:06 -0700 (PDT)
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
Subject: [PATCH net 0/5] rose: fix use-after-free and reference counting bugs
Date: Sun, 26 Apr 2026 16:43:00 +0200
Message-ID: <20260426144305.984349-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several bugs in the ROSE protocol loopback path and
state machines, all confirmed by KASAN on a live system.

A long-standing practical consequence of these bugs is that once the
rose module has been used to establish at least one connection, it can
no longer be unloaded cleanly: rmmod(8) hangs or causes a kernel crash
because outstanding references and running timers prevent the module
from completing its exit path.  Patches 2 and 3 together fix this by
ensuring the loopback timer stops cleanly and all neighbour references
are released on module exit.

Patch 1 fixes a device reference leak in rose_loopback_timer(): dev_put()
was only called on the failure path of rose_rx_call_request(), leaking a
reference on every successful loopback CALL_REQUEST.  It also removes a
dead check that can never be true for the loopback neighbour.

Patch 2 adds hold/put protection around the loopback timer body so that
rose_loopback_neigh cannot be freed while the callback is running.

Patch 3 fixes a race between the loopback timer and module removal by
switching rose_loopback_clear() to timer_delete_sync() and adding an
atomic loopback_stopping flag that prevents the timer from re-arming
itself after module exit has started.

Patch 4 clears rose->neighbour to NULL after every rose_neigh_put() call
in the ROSE state machines (rose_in.c), preventing use of a potentially
freed pointer by later code paths.

Patch 5 guards the rose_neigh_put() call in rose_timer_expiry() STATE_2
against a NULL pointer that can appear when a concurrent teardown path
(e.g. rose_kill_by_device()) has already cleared the neighbour pointer
between a timer re-arm and the next firing.

Bernard Pidoux (5):
  rose: fix dev_put() leak in rose_loopback_timer()
  rose: hold loopback neighbour reference across timer callback
  rose: fix race between loopback timer and module removal
  rose: clear neighbour pointer after rose_neigh_put() in state machines
  rose: guard rose_neigh_put() against NULL in timer expiry

 net/rose/rose_in.c       |  6 +++++
 net/rose/rose_loopback.c | 53 +++++++++++++++++++++++++++-------------
 net/rose/rose_timer.c    |  5 +++-
 3 files changed, 46 insertions(+), 18 deletions(-)

-- 
2.51.0

