Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118C286A0
	for <linux-hams@vger.kernel.org>; Mon, 19 Oct 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402171; cv=pass; b=brDrMIBp+4m5twrqAjPe2NZz2lJPtsUonjsSqfEkJAHcPZtM19DGxgcyCKRmQIJzvejnITpDO0JgaztP08FkJAOGuGyRNqiHK38U8Ypc+Dy/vaSWOtnppNkFjreZgKsYBCDnUqD5XzOxo82HKpkcVUrpK+bW7nToonCB4+Q5e3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402171; c=relaxed/simple;
	bh=G+rrTsphIt7zd72s0j2NxXyY9MYsXldfWtj/1Aewqvw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=OI71UE+GKwHnXnOzZKa4pY/Miw1kz8VF/z1BKagzp/Xga04IN5giF4BzQ5Nny0Tvg+EfdHl+WDGSCN9IYQ0SO9poVEp2cZXXngEVJcm+bESToNUeNYhbuR6e5VTrvB9XBxrAxqR9mNh3QvLpoL4u8TcUfZlyqN5bRJDZSt9f04U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/Tdi4ZS; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/Tdi4ZS"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1613478d50.3
        for <linux-hams@vger.kernel.org>; Mon, 19 Oct 2026 02:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792402169; cv=none;
        d=google.com; s=arc-20260327;
        b=pl0BrOevvQKk22HxMpeJWE5W+wHY79G3AqlMCz8gLi4xKGTepBaFo+/mW+gaxBvvEd
         gG0DauQjkWB3+S0z0acLHqrbSJUrHEx7JikXHRHybcpGuDgfdOUA20hTRVNV8bd231M3
         UFnpMS9z6NPnSYnt6P+hIjbSYWajhpX86wuqZBxccdqMOO/p9Izl/DuMshwwd5R2XQFt
         9/DTuewqUDmxzKLEE+i/uqNVyjlld2uZfk2eTfcEAFxNiutN72qn0/hX4PXEeY9d52f/
         UzHG6+Z9rcX0dt8+xHZCYNIgnWqvK6N8Tq9lC/JqtkQTHFEPvZ6OC1v8NsbM5Dst1qYJ
         Awdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=G+rrTsphIt7zd72s0j2NxXyY9MYsXldfWtj/1Aewqvw=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=NrO3d0E6WWj+Zi7w5vdqc9F8ZxUJ4OoWpYjLNT05tkaCac4rDllfBFuOuakGNEQ2hm
         D+NRXA2dzWmLMTvalOmeDYhtqy951YiKbSog6EaXg9SFQHfLhRJhjHSWjFuNm7F7feLB
         WVDNtw4u01zSRPCp2YhgP8LraZ8qcFC8O/WILU6+3GtBrJ32RWhbRlKF+rM8x4QV+Tpv
         sHsqC9xHx9BOCMHthdozh1xiLWl+0abrUEFhj6OJpvZo5LvLqMKfsfGnf02Debbo9Y9F
         cRsECOoeJUm5ks+/z/pwm/8YXW9O0Tyhu0rjnRg6RqJ0u0kZuW/L463XWB6UWv7Ns00H
         uANw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792402169; x=1793006969; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G+rrTsphIt7zd72s0j2NxXyY9MYsXldfWtj/1Aewqvw=;
        b=U/Tdi4ZSPC0yG5BaXDzN8DnEdXFB/3eZ2gpAuuvFla7l6o03wXfnorbflrD1TUBCR4
         YUMX69PFyL/qDSeNhODQ2N2NK5+COCYIDhnrL2jfEc6LaxuHmD4VG3i8Vk8Gmm9akayA
         DRMvpzCZXRboQN55MLQ1kI5HE4sxt3rtzlvmpyJEKOyjiJWyLY04HrlSF7v20exF7YLJ
         Xb3ouor9WJICgROw3giYALtcHZZ7e+ZShxQ4Y3ya4u11hHGUTXaal66+c1yHKNzRvbPE
         EFSxFMuZAYAXAsQvA7ie118vS/Sv55WnVUHmwTEoM+nrUwcFvXqlak099snvXZMiLRgH
         8FWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402169; x=1793006969;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G+rrTsphIt7zd72s0j2NxXyY9MYsXldfWtj/1Aewqvw=;
        b=MeTD9/3nhEjOWLXXQrT52+FXBVb9CltYhumVqN/3+AxGXLtAeAfRcGXsuQFEUseEl+
         Z6Izp5Cibb20+xzdcwZSQqihmDiggznMlbGFLeSwaTX6ep136+W1h/M2wk2HZhbaHtOB
         uhXaDW5YXGEtBWc1Us9On34ujqHFiDPR52gxGf40ATBgndIuAN35BVRH0s+V2wuMemtS
         KH8/o1G9hsQ3/FEZ+E73K0STvQxUmEv6RKzVGR4AyqaLs9IOvfEl/yGeve+3PAzsSDU/
         shSL3jKxZETAHFS+SXbLFyhItZCKNDPiWDt9lv14npIgoqPpuwIAq6eFS7qSHptdWKnu
         uY9A==
X-Gm-Message-State: AFq9FYLwVil/8ESIy5fYnUIau85Q06PpBRKVlmbgtRK9cRssVPN6IKqG
	2pA213c7RRUbf0DF1cCDqbJqWnNHEsLPziHaeRJfJWFSllPnExUOIGDmo1eYLthygds8BCy/LgD
	OJUUrbJL3dcDl1L4i6i4yOhbOmrc9+wWoFBlg
X-Gm-Gg: AYBFou2xH/Slk2uxCN3OMWIeV6gx/BmHgOqDu4KzoY9MOl0HCHWDg1QeYT/ta5u0pRk
	enmfEf8gUwU2s+wE0xKkO7+8ePvmBN+VmJSqi0gWdPi0M+49nH1R6Q65EFcpuofPSf9pMRM6UAy
	03P2Ceas/XxwrhNxAx9xpJ4pCLdvTvz0WU4ipjUJovhRK15shQPe5jwW4Zg3PlDyVVBPezvyqpP
	VLJVdlNXLENr5oY5EvyuucTGLZ8djK+uJEElLKCSKLIwltJhVAlcozgpWb02dz85RdRpsNkJMic
	KT8YgRPNYJjHhV2mXBn2fCzWLgCyqn+/KTuulXwPQFLO8MESzKn90ww=
X-Received: by 2002:a05:690e:4411:b0:679:bf7c:a799 with SMTP id
 956f58d0204a3-679ca8fc7a7mr1183668d50.107.1792402169382; Mon, 19 Oct 2026
 02:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Mon, 19 Oct 2026 11:29:18 +0200
X-Gm-Features: AclHuK_0t9QwzH_DIPBC9bOCEnjdS4uO6r2aSLi3-tDU5VTWuLtCJf8AhKg-a4k
Message-ID: <CAFAa3YCrpE3YyyiLu8eDPJBmmfEwdsYsNUjExoPsyVgzQAz2QA@mail.gmail.com>
Subject: [ANNOUNCE] LinFBB 7.0.14
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

LinFBB 7.0.14 is available.
It fixes the forwarding with a partner BBS when a forward file
contains long lines, and connection scripts with several steps.

Changes:

- Stack overflow when reading the forward files.
fwd_get() copied each line into the caller's 80-byte buffer without
any length check.
A comment of 80 characters or more in forward.sys or in an included
forward file was enough to corrupt the stack.
On my BBS F6BVP-1 it set the forward time-out of one partner BBS to
zero, and every forward session with it was cut a few milliseconds
after the connection.
Long lines are now truncated to 79 characters.

- The three words of the "S" lines are now bounded to the 19
characters of their buffers.

- The channel time-out is armed again before an outgoing forward connection.
Without it, a connection script with several steps (connect to a node,
then send the BBS command) could fail: the welcome banner was sent
instead of the next step.

Tests:
Built on a Raspberry Pi armv7l (Debian 13) and on aarch64 (Debian 12),
with no error and no warning.
In service since 17-18 October on three BBS (F6BVP-1, F6CNB-1,
F3KT-8), with hourly forwards to a BPQ mailbox in Canada (VE2PKT).

The configuration files do not change.
Upgrading means replacing the binaries, xfbbd at least.

Download: Files section of the linfbb project on SourceForge,
fbb-7.0.14.tar.gz or fbb-7.0.14.tar.bz2.
SVN: tag 7.0.14 (r265), the fix itself is r263.

SHA-256:
fc3ff6d7049b84cb11185aa0083fcd7df0c56f14f51700d5e57958a83249edcb
fbb-7.0.14.tar.gz
7e7a701f63efa1998bc855405a14d032e3d6a44aa600332be728ecd3afa9fc95
fbb-7.0.14.tar.bz2

73,
Bernard F6BVP
