Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1DC3B5F5D
	for <linux-hams@vger.kernel.org>; Tue, 12 May 2026 14:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597066; cv=none; b=d/Dxnr9XHtGRyMpgn09XG+qadRKqcJGfjv3vwpcXzNJ6NyBpnWIwU4fvmbUHjA7hh5wHbu/pL5KcNrTLoloJ4yYDShv6LSZ2jeI+dEKUtuCgFF9jV4zYeEIF53aUolFO/ylqtIQ6MuZybFs+3N5gOztssVBnnyzXNJ4aEUQ4aJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597066; c=relaxed/simple;
	bh=pNjPLUfYOnlL9AuWfKEjlCxudFzPIGw2EJqVl9WOMxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9cpmrUQKrQKjwHt45oUN7gefbztdv+C/nIu5nVxNCcPOhOj6/PTihcF3T8JZUKwIe2bkP+vxjRKOu+reeoa+k3T58oS8HKnn38RMrriZAucJmcqEbPbJQBhvk90r1p12eCVR8t1rcUF/eb8QPKURI4oldQ1f9LmrWbTYkJM2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Parc8l9R; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Parc8l9R"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso3279850f8f.0
        for <linux-hams@vger.kernel.org>; Tue, 12 May 2026 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778597063; x=1779201863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sza2ZxpHlBY8pmqC5zMaFu/RPKkibTVxTiEJ6kAqjb8=;
        b=Parc8l9RtSWs1uSoBeSworOcRTD0ctS3rqLYfEtNkczKqfx9HYKPvgQs4ABgELQw57
         VXadQdQIH+fsvzks32Q8j6wKH44MDtuV0rg8mI5fdjaL/mIDpUpxFw2+2gVTP6isqz8o
         7AXHio+M/gEDejoCF7tXuHoY3Zid1fh9enhiyxmT8Jjd8MRtiZD/t8ffw5SVehrmggUs
         9OqGfo7OOFlknp6X8Hm32QjNNgJDEFD/B6gwGVf+GgNVGuxzmf2ZbqN7f8svy2v9NNq3
         wHGb+XGijRq24soHDH39ni1pWy26RB2ej9ZtBLqKXO92PA/g1z12221VM+pReObyhNjY
         Gwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597063; x=1779201863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sza2ZxpHlBY8pmqC5zMaFu/RPKkibTVxTiEJ6kAqjb8=;
        b=Bya0Orv34WDYdOlyFgRbVnvpKYaXRqi6eaVsv67YHAXoQAirgywzvtkMbAQtGUD0kc
         alWs+hfw8B01GizhbgdAHoQ3XlNE9XZfD4B1gBEVUt0nrS3g+qPDArmMnfTZ2f5mNyJd
         g45QDTnunx30Q2ZsD96TGnVhy4UadQIaWIBL4fycBw0sT+XDmNErPlqFCt19DWPAlbJr
         A/QiBmahc7Me2gctOvKqSZib4Mfk3zV9z0E0XCgYL9cqXfawd0n9wG/dt9J1JYxBC/nE
         d5lXiosTXzWTQdcUKQInNDYxnwiz6uF5SV42LdnsrLMhcV5m0IPbwP3GJrTdLwVri0Pj
         Zq3w==
X-Forwarded-Encrypted: i=1; AFNElJ+Rc5M3G8iOpcU3TRu80bv5H7kibUAkNNaNQMcqSeK98n99vXT240aH/PbDnQr5wVR1nkSRenir3l2W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1Up2bHai3dEJtVbFl+Dl48c8eeFmJmO+fQQwU4iixKXqDFqQ
	NkySF03Mcj6Kj8YehsIJIh4KbLq400sV7khT4BSGXLfH28obP3Y6r94R
X-Gm-Gg: Acq92OHP1rGcpUxp5dTpXMFg6CwwnURxtNwAJQ8hG7IoriDrw0KO6l54g6LHTFGiAaZ
	WfLjO2IB2nwXGV4M9Yzha1BJuAY2btVEmlHLDfBHwcspFvxHDcdO0MpIM1UTSdn2SN0hwAAMAg5
	th3Hqog/tSsNgXfzSAUrPj9n2Uv7PXxNqgdPn98p8A7cCbgRxdy38G7Z0uUtcFNBqiQ9U+GTHcC
	LaDaLmovpqSnFw0nXHoFYOrOxmCD/mPfiwylGFpPpmHsHAgbi/0d+933T7qY6D2YRjNP8+wToQJ
	9myH3lkDPBN+iQ7P7UP94vW3Y68wuCq2Ua++l1qjS8XbbFdBuC/0v2xOxI+tUGzi3nQlgp3kaqn
	myYTX2unLPXV/aAoPWuA0QgT0tqiIEtukjn8t/nCRUSVs1x7EdmtfJTzuKzoyJVpWzRQVPbosA9
	DCDq6xlgvFBVkFAEU1epyVZwGcyUZi3e7cNvifn4gCf48czZE3xEJpspb0gblRaYld2Xrgl6yaH
	fwu
X-Received: by 2002:a05:6000:4011:b0:44a:aa3c:5927 with SMTP id ffacd0b85a97d-45b13e55d33mr5041184f8f.29.1778597063157;
        Tue, 12 May 2026 07:44:23 -0700 (PDT)
Received: from ubuntu-f6bvp (lfbn-idf1-1-304-238.w86-195.abo.wanadoo.fr. [86.195.26.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm32858657f8f.34.2026.05.12.07.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:44:22 -0700 (PDT)
From: f6bvp <bernard.f6bvp@gmail.com>
To: toke@toke.dk,
	kuba@kernel.org,
	stable@vger.kernel.org
Cc: Bernard Pidoux <bernard.f6bvp@gmail.com>,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	gregkh@linuxfoundation.org,
	linux-hams@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio (hamradio) subsystem
Date: Tue, 12 May 2026 16:42:28 +0200
Message-ID: <20260512144416.9848-1-bernard.f6bvp@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <87se8mytvv.fsf@toke.dk>
References: <87se8mytvv.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bernard Pidoux <bernard.f6bvp@gmail.com>

Toke Høiland-Jørgensen <toke@toke.dk> writes:

> Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>

Hello Toke, Jakub, all,

I understand the decision to move AX.25, NET/ROM, and ROSE out of tree,
and I am not opposing it. The maintenance burden caused by AI-generated
syzbot reports with no human follow-up is a legitimate reason to act.

That said, I would like to raise one specific concern: the ROSE subsystem
accumulated a number of real bugs through upstream commits that were merged
without hardware testing. I have been running ROSE on actual packet radio
equipment and was able to reproduce and fix five of these bugs, confirmed
via KASAN and netconsole.

The most severe symptom is that the ROSE module cannot be cleanly unloaded
once an AX.25 connection has been established, which makes amateur radio
applications that rely on ROSE effectively unusable until a reboot.

My five patches address:

1. rose: fix dev_put() leak in rose_loopback_timer()
   Fixes: 0453c6824595 ("net/rose: fix unbound loop in rose_loopback_timer()")

2. rose: hold loopback neighbour reference across timer callback
   Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")

3. rose: fix race between loopback timer and module removal
   Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

4. rose: clear neighbour pointer after rose_neigh_put() in state machines
   Fixes: d860d1faa6b2 ("net: rose: convert 'use' field to refcount_t")

5. rose: guard rose_neigh_put() against NULL in timer expiry
   Fixes: 5de7665e0a07 ("net: rose: fix timer races against user threads")

Each patch carries the appropriate Fixes: tag and a Tested-by from me on
real hardware. They are visible on lore.kernel.org.

Since ROSE will no longer be maintained in-tree from 7.1 onward, the only
remaining users are those running current stable kernels (7.0.y and
earlier). Would it be possible to have these five patches queued for the
stable trees via Greg's stable process?

I am happy to resend them as a formal series tagged [PATCH stable] against
the current stable releases if that is preferred.

Thank you for your work on the Linux networking subsystem.

73 de Bernard Pidoux, F6BVP
<f6bvp@free.fr>
