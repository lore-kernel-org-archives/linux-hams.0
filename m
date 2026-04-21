Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD843A7825
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773240; cv=pass; b=jZ2fq4nojpdx6DLd6nMzGHXIpNkSyQlLwLgbZkeLpf6zfrVFy0Ahd6vudcAK/F30ZPuUFECPg7e5tYp+4q009GUkdl78WbsIn5ZtGdgGhmuew66lc4WmN8Y0KkC6pjZCXV0WYDRGVDIRXDHJFTXJ5yHtJcTHdlNT7h+3+AsuwiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773240; c=relaxed/simple;
	bh=/4xlXlgr5gHhEx7hkQ+MHrDMIugb+AXYYNkM+Z3m22s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DM0Ijv4fVQCdcDaI7qczAhsJmbWMolpEG5BiJRRLLtBXAMDp6No5bZMC2hOw//6vkBzMevub6QPhClMfpL6gYdoQBDnqwq9nIY/N5jJ/lIfO+moX62NCjmzvyNZJztDpaU3/Um9R0cNRg4jVvLq7aUTe/zN/P/EgExiFxdjXcYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpMfWFqi; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpMfWFqi"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a535e7c00so45924687b3.3
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 05:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776773238; cv=none;
        d=google.com; s=arc-20240605;
        b=jZeI7b1tK0dBZ/0WBUU/aTfo1MmoRk+J2WM/sfxlZ5nTrHe+TtrAoGQ6LHJTf5lJ9R
         mBtP/a0IXFWMaEbygrETEe51mzsAbQtGI37YIGiBJ/5gsRwjBcbyD36XrMU8dkj3v3wD
         naN0KfRwAvLrB/zaEZzvrXDn0zbyqMQ3t3RNUMxNjaSGOUvJrjXV35GeATh4iRM6A5xu
         mo2uw7Bup6scAbuLnmOwSwbaKHTQ6FdchaT7MIuAqkjZDXwj1tdQ1vqNI6pvKLNsi/JR
         xziod/OxBhZs9QgYCJxueEqECvCHmwIjCEQdr65VNfuMKS2tba6MtEbzg23csk0fHbzb
         6BXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpkR/kk9mZLrEXxtkG1ZvoW6WEbgKq8NtjJV67sNSZg=;
        fh=gT0kdAOM921gFqU1bVt2NAWY++3uZDXCgdt50cydG3M=;
        b=EFby5g1IF+UTKtp+5WYhCRX/xmH/EvF7/0z9ej/1UXYCfNnPZ8yFkYpMbw+NCqW6t1
         xvqRO8OTD7fygFhu9GrbgMrRLw9JB79CDXzzTBSwpg3QFG+d/E+9wSVVin6Y//HhwEI1
         1jhEmhix0gXAwgArVJHi+51W8WBTlmzlfmvq8F/i9mFdFe1KMtVUZeYEkEzeCJOiBJwx
         z38tf7Q7+/FJ6yEGnAJ7Es3v0Z9KqXeSoH99eh0/hQSTk3N+f7+U1d9gh/f4EHXOdMgn
         SWypZHm71uNwFqdc9/5ZwXktPIFpZso2ZpowtzrNZQozFbY7vvaqTWT6h+P8TTLXl7P/
         hkKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773238; x=1777378038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpkR/kk9mZLrEXxtkG1ZvoW6WEbgKq8NtjJV67sNSZg=;
        b=UpMfWFqiNGTufhiBe3zlzyDkiOLop55WB7RrqrbYGKkSdQvEBsYwgaBKbFBmkxsbAR
         7BqMRz456e2OhtDnhJne0pI0QzLHPzsTWsH41LqcgOWsnNsKff5+0eyCjn/IE/PMvP4M
         l4OVLtuLWOvlZEONEEP/3qI5nMKidV5jce3fRmdM9D6rZJrngzxJcF0oK0boVFV525HD
         GD7B4mWQju1WezwICT7/v6QgCZ2GjYmg8FOEgO5MV5h1u+6T6Zk/v9lVLrShyeAPBXhs
         yy2O4Qf+XWjx/J0vcwmLa8xZioN+hmuzygUaDJhORiOBvNgpqbi0bp8tkHo6UOhFbmC9
         axjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773238; x=1777378038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dpkR/kk9mZLrEXxtkG1ZvoW6WEbgKq8NtjJV67sNSZg=;
        b=nCzlambWYGmPmp+GyTwCtA+JPtHZbMlEhILNYXmKPnCuNCL3tWmuH6hJCca42cNDAJ
         g7pMWqSzrm/r3tgtgweBrngI5MupuYO0kghZk3KQ61FwSwdZsjtulhX1lO64iMxEBJh+
         8PJoTGOoYPNdqJy/LCDgMya/Pa8TMyqglDFhDbTmPrhREYkBt0DEjUCNn8tUiIuBoSSK
         BhGYnl/3XPIGUEFaYwrSzkHI9oAMoh3CVHrzDEDHG1s+iTKSRpFs+CCZfLF6oCDbFLjb
         ZLtqrkuv398TJ6YHV+6Cxd7iuJrztdl5TDiERCq1lghPdRqDJ8rRftTVN1hO0pXBTgEy
         ij0g==
X-Forwarded-Encrypted: i=1; AFNElJ/AjnJTj4bb3CBSKbTEhGYTpnhVZ6Nk0D0F1h5Divcy1gZPYh3OxkhRPQvSwPGnx3kSiRZpduYpRy4A@vger.kernel.org
X-Gm-Message-State: AOJu0YxOd7qbLLeINBSoGo2Q+AQoNEe6SqY6vK3RfcrBjM64WIeBnqtJ
	HE4UakD6S1qBAAZRl4s7zrLOaSokG5Md2my+CJELBQul3B1T/Uw+triesRoy6yVfViADJ8XCU2g
	mFLoUao8YGmG86+JKl0+SeTMI6XI/e2M=
X-Gm-Gg: AeBDieuklizTSsC5Si2jk2gxktn3M5zb3za3Nn6Lf2/n9plWxaEXy+M5481ddOgBKhP
	TWye1EOG3OEoJ8AcKc/sNM0X7gjfjBbQ7dwQhl/VCsut34XOGTEwRrnyXhEpIGpYyhSxPPVgbUF
	BAq9K5XFme7w3XUqGJ3TBXE9f92C8oJsvOOB0mmzAOsIIoFz3oB0ro+WJy5r5JWzSx9R8rp3IjW
	gi1VO77bU6dN8g61syKho1+CuzLRAP5y1OHBsJjGzv14MPaUAPYUz0PK0Cfvb3GJsUNYIUYwQZd
	wFQKaAvt+aJh6zZApfYjgU9QRqVlJWBdph2uYgi4Lb/yCVHn4r2SBt6IBWLj4+Bt7GzjhR8Nfu+
	gDYQMX5LVbpoj+aGdXXyFpJ+T7WQDBtHFlXTr
X-Received: by 2002:a05:690c:6287:b0:7b7:c5a2:fa49 with SMTP id
 00721157ae682-7b9eced6930mr181294537b3.18.1776773238303; Tue, 21 Apr 2026
 05:07:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com> <c412bf83-e8cf-4a3d-8619-63f68e108399@blemings.org>
 <CALJxBtX_T8sv11ank-arLfoVqJqXegi3D_ZT9ZFbMHkuf-2RAg@mail.gmail.com> <5549733f-c9d6-4bae-84e3-285a317ee334@blemings.org>
In-Reply-To: <5549733f-c9d6-4bae-84e3-285a317ee334@blemings.org>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 08:06:40 -0400
X-Gm-Features: AQROBzAzZ0GRugiuEw5UqkQyvcGzt_cc-9lr5ym2yuO6kTF9x3niAKkyk3PvjW4
Message-ID: <CAEoi9W4L3WTVv5Hhiec8D8J=654h-p+Mh_Nd9bbm_cDyardsVA@mail.gmail.com>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: hugh@blemings.id.au
Cc: Steve Conklin <steve@conklinhouse.com>, Stuart Longland VK4MSL <me@vk4msl.com>, linux-hams@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 2:28=E2=80=AFAM Hugh Blemings <hugh@blemings.org> w=
rote:
> Hi All,
>
> Just to note in this thread (top posting as it's a bit orthogonal to the
> rest of this discussion) that events have preceeded us somewhat here
>
> A patch just recently submitted removes the AX25, NETROM and ROSE code
> from the kernel moving it to the mod-orphan sub tree of netdev
>
> https://lore.kernel.org/netdev/20260421021824.1293976-1-kuba@kernel.org/T=
/#u

Wow, that happened much faster than I had anticipated.

> A shame but perhaps inevitable - but I think we have a good plan
> unfolding to both take care of medium term maintenance of the kernel
> code (in tree or out as it may be) as well as a move to userspace in the
> longer term.
>
> For the benefit of the netdev readership - we had a thread over in
> linux-hams on this but that may not have been visible to folks in
> netdev.  TL;DR: we think we have a way forward but appreciate this may
> not be quick enough to meet the requirements/concerns put forward
>
> If we can delay removal, that'd be grand, but appreciate that moment may
> have passed.

Personally, I think this may actually turn out to be a good thing.  If
nothing else, it's a forcing function for the ham community to get
serious about providing an implementation that works well, and in the
short term, an out-of-tree module can keep things working for folks
while alternatives are investigated and prepared.

I appreciate that folks want to discuss timing, but it doesn't appear
that there is much else to be done at this point. It would make sense
to continue discussion of alternatives over on linux-hams, sparing the
already-overloaded readers of the netdev list from the sordid details.

        - Dan C.
          (KZ2X)
