Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793810533;
	b=SgogRR7qvukSOCG47kSi+ZdX+T5kwhteUt2xxbRBP+E5P5PRuAePlBdG6YvdBspFhpDd
	 BljqbbZ6L/j4YH+eWelZla4RQc5As2Gr2TMEVVCLt+Rjou3GnVz3OQev+7qDHSaBp0LNq
	 UmKjp7kImdjfm/MU8w7JIhHPEv07s2BbgyD0pdReXkpft1MIkeQGW3Aw7XcV2hQ1EOMOn
	 Xbh8ylcPZo7oJOdhWqr0mKdjUdxy8OLdQGu7t6uow6ZWo4ZGDVu+uAQq1Lb/R3sp5D9op
	 VibnFDoAtEtpejh5pbz8mq2QrvZd6jPABPd+/gWlviZekeka4eBkRDEU9KdrI1HybTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=5Jmy8Q/ETOeaY/pH3I5RISc+ZBgMk7GtpwXwon/Wyvc=;
	b=MzujvzW9ltJNkyaw3HbASb0Oec1YVOZBsLTH0+Vp44ZLlhGhsLEtCXHtO42piOjy6PCR
	 tCh4d92Jj9mqDuengT5Ia3jfbXcGnt66bca0wYZnLjpfXAUhjmKCUxk8ToJaTo1zVBW+q
	 NSU4phNKZgjXJqNKZDb3QGiUbU0Sm7ctrET5PsgqQn2BreYfosA5yjbEN3ZzuxKZg1WBi
	 dgWZixUao2W5LfYkNlIcl51yVHI5uHva3uMKwBZD5MIxxqPpWjO1EfK6Fd5Xb4itHrbGC
	 lkdQ8/QKaZ1JFakQENok+5INVVzCOwa5kjv8KWP/eEwHdl0Nt+I9LG0tGc2Wu1JAkTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjIXmrb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B91606A31B
	for <linux-hams@vger.kernel.org>; Wed,  4 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6B91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lcjIXmrb
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8aea7b7ca0cso9819297b3.2
        for <linux-hams@vger.kernel.org>; Wed, 04 Nov 2026 08:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793810532; cv=none;
        d=google.com; s=arc-20260327;
        b=hc84x7WeAb9/wbWwaDALriOOWJ2FgR9R4qhpFvxto/oLJVLdv5YBbUtBZFjDJGWcoQ
         PA2MjIY+Cai9xjSmKWmzt7s0RjHkd9cicRan/EQcVgx/77VhZ4IgQCF3smDC0EWQKl65
         LWD3vDXFRrfYyLo68JlAmLr0CJXfAlaV++9CUTk4QYTo3aySdgk7N1O3BCZLLjeM+LZV
         1PRC15ySVLQOQNOVPPOPNaCt74lk9HZHFSPo1VSJd7xbPoHMyQLBOm06B2OLpGXUiHPZ
         3s2//++SHHMr22/dVg4/UqrnIvRQQ1q37/fNvxwmn5s3MAVgtTQbVpaqkKyw+XCS4GvP
         da4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5Jmy8Q/ETOeaY/pH3I5RISc+ZBgMk7GtpwXwon/Wyvc=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=C6+f9AshRv7NCOZT7/hwM41YU40RHBrQD9H5cpZU2KcOjRBBD0u9s0IsDlWbJ/Y8WA
         q1nqOrACeu5Ai5ibaS3M5p8oSx87BHN9G6zMvuTWLSPh+F8nUUhyGxeVIRBH0by8Hh6w
         ZeKwljGpte5xIf2sk+iilYir1OVjREQezle6CGXtpH2n/2+37RjtrmDf+1Jf1h5Bo0ZH
         aACQ3BDX4t/Cbda1kZEBnv4C6wisWWr2vQJvc7ODEfIvIlfJvb6MJOAMW24Vc4U4og6z
         6IBD3lrhirKmGj7NJWFhUlju1d27XnvCnQ8Jk/5fq5ogZz1OwqAchVxWPGEzFtdnZcUX
         T//g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810532; x=1794415332; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5Jmy8Q/ETOeaY/pH3I5RISc+ZBgMk7GtpwXwon/Wyvc=;
        b=lcjIXmrbXBd/Jg6wpki73pCp+XZUFToEvU+738JUSkIVHDpi79pjpc16/8vccsBE/j
         xrk7mmrFxp+8yROmxMjqjh5SGsq+BKrUh2TGABVnC1iZ8DeNClS58tfki07LwoYvkZo2
         U6TdOUqEeVL7UZSuv+tgJYtLPj5JL+P1I2GLdFQEm0by4o3R+r8UT69h4Um3HXHJx4GY
         AaD4Q+eOLcYHWhe061xp064zzX/L3BTLbiffzqT66/gJVlpZQrbHgFkbiMVg7ySq0OK8
         vzUioCm+45CtYpoa65iNerMAdVWH46kh6mCSjY5Thsyxj8S+5FOwKPANi6R7A+DYygVl
         okpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810532; x=1794415332;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Jmy8Q/ETOeaY/pH3I5RISc+ZBgMk7GtpwXwon/Wyvc=;
        b=I8LWkH9fU0xhfAZqLZS+xIzKGeBfx8/bfHSM1+Qz8xRt6+iRZREqXEb5xMOkovxkGy
         zB5ezaPTku/dAae6gmZnyyEC/ye34pPofLRC7vDL7KFhxZRhof7GgEbFqrnOQgwD2rES
         7vUvgxx303mbv9LUXHRP/FdctdeLscPWy/fvNPZQLV1hTVHb9IfBR+IwaPWz51ou3/pT
         J3NnSjYntbeBLvv9OF8Rj5zRYCGGP/t5B1aP1jaLpCzxNIHhVY9fLLPnc1B+//zCTpah
         p5HB8e5z4pHoyfxa2OO/5a6JVT3caY8dP4qh9+4AB1yvIgL4u4NFvSkF/Ls0/Jy2FZnI
         AdJw==
X-Gm-Message-State: APuU4Z8ziAqZvd4pFMuD4qd+qcQIoLr+LOnu4m8x9bMVE8eM3tScYE9/
	tihKVa0zP1auj3c+wugIqO6pLkdSId6cZm3Z7aTIWr2aY7H21goIF1HD4pw7oNYuXDQfN1FMNOR
	rjRhmXquf7YPl1sJ2xp90tClvoFNKSy2VGw==
X-Gm-Gg: AYBFou0IPzkUYWpfWaekuKt7zd7YYQGlEjlv7RunCIAElaOn/MQUC5JBbfOXyePAXkx
	Y85NJ6a25Hoj5xbax4Y0iuHwdBLU1AlDD2xAVRVdTRpobnSR5aF8BlF0Ry/+fWuAKID+bIDCPd8
	6uXZmpmeWln0YRdC9BgoDq6RtLoNKst37J2tYRu+gLDD6XsFtpNEO6EXzigFZjTw0XEKZP8rh+m
	6TdofpYPA3bVmitHY6B+kRtRPXQVmxXbl+CwbRkojUqafnf0IBfOUSkS5JbfuDvlQCtXi7Wum9J
	0T5mwWxrRCl1tRCG9dna//LctfRkt1+QJBGqBNxUUlAQC8ohOcnah4n0O2IpXJPqGWpm2MxS3H1
	3SHdN8KvuluXj6qCLUVwAU7H1145bluqC/avcwQCAAZTbM6WAm2PepsvsYw==
X-Received: by 2002:a05:690e:441a:b0:676:9578:672f with SMTP id
 956f58d0204a3-67ba5023591mr6646181d50.135.1793810531553; Wed, 04 Nov 2026
 08:42:11 -0800 (PST)
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Post: <mailto:linux-hams@vger.kernel.org>
List-Help: <mailto:linux-hams+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hams+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Wed, 4 Nov 2026 17:42:00 +0100
X-Gm-Features: AclHuK_0-mTacOT0S22IO5JRpviEj8RDRidlbBQUcY-OwAqJjo3oRr5kspuz1ws
Message-ID: <CAFAa3YD22adu2JPQ5VWSN830qZ3CJ5p7j9ocdwpOuXHu7cT3FA@mail.gmail.com>
Subject: [mod-orphan] NET/ROM kernel module: 11 fixes, one for every Raspberry
 Pi node (PRs 61 to 71)
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Earlier today I announced fixes for the NET/ROM tools of ax25-tools.
I have now read the NET/ROM kernel module of mod-orphan in full, and
opened eleven pull requests on linux-netdev/mod-orphan on GitHub,
numbers 61 to 71.
Each one describes the defect and gives before/after results of a QEMU
test bench with KASAN and lockdep.
They are independent of each other and merge together without conflict.
All eleven have been running on two of our nodes since 4 November, an
x86 PC and a Raspberry Pi.

The one that matters most for node operators:

1. A NET/ROM circuit gives up after a single retry on most Raspberry
Pi kernels (PR 61).
nr_create() converts transport_maximum_tries with msecs_to_jiffies(),
as if it were a time in milliseconds.
With the default of 3 tries, n2 is 3 on a kernel with HZ=1000, but 1
with HZ=250 or HZ=100, which is what Raspberry Pi kernels use.
You can check it in /proc/net/nr: the n2 column shows 0/01 instead of 0/03.
After the fix, our Raspberry Pi node shows 0/03.

The others:

2. A use-after-free and a kernel panic when an application reads more
slowly than its peer sends and the last fragment of a message arrives;
messages joined or cut when frames arrive out of order (PR 63).
3. Frames leaked when a node's own frames come back through a routing
loop, and when forwarding a frame fails (PR 62).
4. Two circuits given the same circuit ID when calls are placed at the
same time (PR 64), the same defect as the ROSE LCI one fixed in PR 45.
5. recvmsg() returning user data as the source address, or a few bytes
of kernel memory for a message shorter than 14 bytes (PR 65).
6. A node dropped as unreachable while it still has a route, after
another of its routes expires (PR 66).
7. A frame received with a TTL of 0 sent on with a TTL of 255 (PR 67).
8. A window of 0 from the peer leaving a circuit established but stuck (PR 68).
9. sendmsg() reporting a long message as sent when only part of it, or
nothing, went out (PR 69).
10. Smaller ones: locking when a NET/ROM device goes down (PR 70, a
fix by reading, not reproduced), and the BPQ extension byte missing
from a repeated CONNACK (PR 71).

All these defects are old, most of them from the first kernel in git
(2005), the n2 one from 2006, so they are also in the mainline and LTS
kernels up to 7.0.

Reviews and testers are welcome.

73 de Bernard, F6BVP
