Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7840C411695
	for <linux-hams@vger.kernel.org>; Mon, 15 Jun 2026 17:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544094; cv=pass; b=Lh6s7Czum+CQfI3rSfVJ06sZxlV1siROhIlEMskoKPOsSl9ESOrOJ3HmwH4JU5YCOK+8lQMkQKs6hj5tHtctuJdzx30Gt+z5nHPu1qxb0Ri4MRYFmI99hWN31iAVg1oQxi542AtDZKG9g3UhZt34rt81m1zhhtqr8i5238pqlDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544094; c=relaxed/simple;
	bh=wF5HKc3NlWnMYgKJPWbT+7KgZJa0XNXIuSPTgCwQhwY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZLuGAiN2u42O4LJ9y+jSHeoj0RNOff52mDYx1vEnhk9X5RKhp0hrIenOdNlTbcIVj/d16iJTX2s624Uu96xYF5mmjRf+iau4hPfJZg/RC66EG9gW++8Gx8Wv/Ookik9WkX8gHlcM4bqw0g/HeHGZigSDotC9IkjSxYk2v/8zatU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVUZTgsJ; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVUZTgsJ"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6608c1a4215so3830360d50.0
        for <linux-hams@vger.kernel.org>; Mon, 15 Jun 2026 10:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781544092; cv=none;
        d=google.com; s=arc-20240605;
        b=BRwzcjzuKZ7+V1yZJ8NPgvbVemTex5Qb26NxTpkClDOtkTON9WNs0XI0gTmcFaAShC
         f1l72iUd83SSp6uhWDK/Ik9VK97WLpe2vW6dvk+ModSgA7gHCBfJzN6DpgZEMK6cmzkx
         AsCnWYMyFcVPefiwRKc1upnAJshWq5YObGZZ/RWSMG/IRKWc8ambt3tlC0FQLlxaq1QX
         Ts6rAZTjLqSB6QoEhQ9NEzaOPXYegDKfmZUdW+pIWQvNA1wBBzlaptQVOk1chvzredxy
         tof1OsZNEPTLLw9z/CMVR2R6QBWQURiHdck41nCyw7G0IkxIhYKY5tRFUg83TaoAgwz8
         6eIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wF5HKc3NlWnMYgKJPWbT+7KgZJa0XNXIuSPTgCwQhwY=;
        fh=5QocTMqF1KTtXxX0PHOi/NQFBNYD2qrCy8pXt7wvcvw=;
        b=GEq6GgdoKAPEV5fdCY+laEFEKpV+CRdkPMfO8GAW2bnV6T2j7b1lLS7/LW1TpqsgWV
         WYkvyXUWWHC/Uqr7C/jghfhB85mieQU74nAqTseW+TQApYk1unzGPG/7FmliJkw8dHoB
         K58EE+vaP1owNGVj+AUZOKVvVg0Ej7v55EEgEGyMlbUBBv0WIVs3gNzB8IwwIrr2vTFW
         YBzhwb8HbB2VzHQXNwUEB/VYUVst/g+wd97aSbAMhTHPwR38hrfDRrtMd6U8jSUZNYJ7
         Kc5rl0M4elTsZ2Ami2kLTDOSaCB1xV+jpvU7R9pqz+nzjtykYdk5RzhvyL3ZB8I5/c30
         WSwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544092; x=1782148892; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wF5HKc3NlWnMYgKJPWbT+7KgZJa0XNXIuSPTgCwQhwY=;
        b=XVUZTgsJJ6eT7IthbeqM3ghLvmfW5405ufh59NCt/8p3KkajgW6mhvPpwEWqrMTDkn
         zGTkl6KWr/GHCx/C6DtIVFfoBQDqYGRw9wtvEMNn3P+Mk60I85KCiVvi1nXq49w0x158
         l7SNshYnYleTZgyo0WXlpsHqjbuJHzpvHLmP8YkWlKvAP1/UMylbb9QHE1+/IX8LmRgJ
         4Ul833jIYYeefVIesXRJUzD0I7v/iq4p1GmgJIs8jDq6ut4RsyccfO7lUwqjeXYYpdat
         R6cPhyvrJhiWYqh7u8nrqA/xUhgLvXUrSWrXmu1FgT4XdjhWzUjXXiOYSNOWf67HlVQD
         Z/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544092; x=1782148892;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wF5HKc3NlWnMYgKJPWbT+7KgZJa0XNXIuSPTgCwQhwY=;
        b=g9vjYVnW2B9aWDef6vzzhxzClDKtzIiPTKJSAV7xxF3URDuSRT760d4M4wOqZyouWu
         tF/V0JoOenEwXTf4KW69pL3if9GMhQ+gGjZCpHtvlUle+FwOuTpQCw6YvYdOBosSMUqU
         EqvzYy59Bc0KGMYm3t9jGNzPhneCUtPOhvEZ4srOt0+YQe4sC3C2m8guJ8NeGeBy2dlf
         uKjhJCas1Y9IfppAvo2XBbFsAaio+sEI/w8W24Wtv3yQFpNe5Pek3Wj01pbzidcDDYgD
         94N3Aym0OhqAkUN3fn7mBQX/Yg32x3TgnXXJafnGrYrT73X00feG6cPwjRRzLImujZoQ
         73MQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mwo474XW2NBDx1gaWue79WPrS9/j+SIeGuyrpk7clnDUD2znRybCiZnfKqllwPStmsuqHsUD15ewy@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWUC8XcqncfnGkJrBS6ycV9l3I7iBHwlzBBIZ79nZd5hqLdcN
	XfmEducCHTKH754PKkLDK6Xkwe5zBhsplViONc6dODbd2uvhROmm5zO9ZanACGywJxgu/D/L6xm
	FWcxpoyha4q7PHNfnflCWP4o6oI2Rzr0=
X-Gm-Gg: Acq92OGiVCAcw0bc+3Gn7/7kConoJBd2cH19GrRmO2AtfuyWF+RWDv2s8KnKvPsG0Pa
	V50qEK2OWs3aJ8ijjVk9iI8vJ80/urv49RxWAxnjr1lsdYBWU1SIUNeHGFcW65yNOvzTVXNyPMA
	NEhnfbIeZxGTdUr4tY5XQCCHNF02Qdf4Dt46eF5i9bkDZH89FM9irqSXXSB/wMJqJmO43wO/XDY
	jzr5erEj1nSmQzcY33V5jKopBZ5akLQRCS5yIZ+FswdnWWTjTdR3cMZbkrPkkqZ4gDxW1YP9I0M
	t4Vv0L4=
X-Received: by 2002:a05:690e:43ce:b0:651:d0a5:cd8 with SMTP id
 956f58d0204a3-662b49b16a6mr232309d50.16.1781544092547; Mon, 15 Jun 2026
 10:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 15 Jun 2026 19:21:21 +0200
X-Gm-Features: AVVi8Cfx2WLvuC07gWkUHIYLkqC8GRswBa4fvWRv9pAp9jc9hAVjLgw_TGpHFzM
Message-ID: <CAFAa3YBfk2UOjAktrLq3_9+563m6UZuKv9XdBjfp2aB1twV1HQ@mail.gmail.com>
Subject: [stable request] ROSE memory-safety fixes for 7.0.y and earlier
 (merged out-of-tree in linux-netdev/mod-orphan)
To: Jakub Kicinski <kuba@kernel.org>, stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Jakub, Greg, and stable maintainers,

(Resending in plain text; the previous copy was rejected by the lists
because it carried an HTML part.)

I am Bernard Pidoux, F6BVP, an old-timer ham radio user of the Linux
ROSE implementation. ROSE and AX.25 no longer have an official kernel
maintainer; I am one of the people still running this code on real
nodes and fixing it when it breaks.

Over the past weeks a series of fifteen memory-safety fixes for
net/rose that I wrote was reviewed and merged by Jakub Kicinski into
linux-netdev/mod-orphan. They fix real, reproducible kernel bugs that
affect any node running AX.25 networking over the ROSE protocol:

- several use-after-free conditions in the ROSE teardown paths
(neighbour timers fired after free, socket freed under an open fd,
sockets reaped from the heartbeat while still owned by userspace);
- a rose_neigh refcount underflow in rose_kill_by_device();
- netdev reference double-holds in rose_make_new() and
rose_rx_call_request();
- dev_put()/neighbour reference leaks in the loopback timer path;
- a notifier unregistered too early in rose_exit().

These are crash bugs (use-after-free writes, refcount underflow) that a
remote peer or normal session teardown can trigger. They have been
soak-tested on production ROSE nodes and confirmed to remove the
crashes and the kmemleak reports.

The problem is the path to the stable trees. ROSE was removed from
mainline in 7.1 and is now unmaintained, so these fixes were merged
into the out-of-tree mod-orphan repository rather than into Linus'
tree, and therefore have no mainline commit ID. The normal
"cherry-pick from upstream SHA" stable procedure cannot apply.

However the affected code is still present and still buggy in every
stable series that predates the removal: 7.0.y first of all (the last
line that ships net/rose), and the older long-term branches that carry
essentially the same ROSE code. Distributions tracking those kernels
currently ship the crashes with no official way to receive the fix.

My request: would you accept these as stable-only patches applied to
7.0.y and to the earlier stable series that still contain net/rose, so
that distributions pick them up? If a stable-only submission is the
right vehicle, I will send the series rebased per target branch, each
patch with a proper changelog and the bug it fixes; if you would rather
route them another way, please tell me and I will prepare whatever form
you need.

I can attach the patches in git-format-patch form for any branch you
name.

Thank you for considering this. ROSE is a small and quiet corner of the
kernel, but the nodes that run it are real, and these fixes matter to
them.

73,
Bernard Pidoux, F6BVP
bernard.f6bvp@gmail.com
