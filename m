Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795AA3D8912
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776782646; cv=none; b=f72+Fdp1RJZnvX/8DU/L5bVsmE9W8E8SHccAPyYnw91YN9LNXv6tg9c4TCkNIQTOJQEMHGN6nLTYDqjaM/ekfFckplDy29B193h9ZDnO+SSwCEqAnA5oNgIsPV6NEJ8W0MOjuZO8lilfDsSFUVn9cQ5WkRDQWekt29ngcvygT8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776782646; c=relaxed/simple;
	bh=3Eq+F8XSry8xQEbea4+lGZrP1Td8wfV+hyTcMXkTbmg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=U7ysrCp6YwrIG8fXR++tEcc1ieP20O/veJkHq3otlvnlA2Ng4fmEJ5q2sHWGYbJTnEJyaC39CIP9oe6lruu+sm8xevA2ZbE4MuqvCs0HlK7OqMMfzwEsVccKfjfCeMFW8DaqfaQuYGfl3EdV5aDCQ3Q4fhArzVDkDhHhEpBRIX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKX9rm7E; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKX9rm7E"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69498319ee7so368077eaf.1
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776782644; x=1777387444; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTO2z2lC1hKQZZZplCzqHXyc5pEkF50MtyRflIcZLWg=;
        b=VKX9rm7EBaSPRTnyaapswHkcfKqwYfK/cunxJMRlyWiS0HtPuORs/3gpWEFrziIOZO
         khNWyVJPdWmhngwR7lqiEMKMu13ZjnnNoqC1ldV0NhEEbtEYTzKXISwNMcpMFVZe0szI
         GYxE0t9jCv4gnN23rRaIlvi9oZP7nIBU4qfcODaXJacgYvKeDKkVZnQtw/PaButKK8dN
         zWwn5/5cplsBAyqU3pMSsjsetGjNzycmyw5PEFhh++CoLJEl3KTE28VgLWrFtOsl5zk4
         x+zbJ0uZqJnqvq9fNLbt8RUdeA6BZ0lPrYulIKrlMq18kL+MrPQr34MvRoKKdjryTpJm
         1k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782644; x=1777387444;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTO2z2lC1hKQZZZplCzqHXyc5pEkF50MtyRflIcZLWg=;
        b=nzggb4rekop34kH87mEXaGZLmdgrkLPw7ovE27/Nb7+wD9sG1ytiFU33bJeT9a4Qkw
         QlCMLvY1pazH3GpO5+9icpXS+lYJK+HMxXMk1k8jJfWDHE39P/JmGrzWbJly+97GNO1G
         SZ1p7Nurcn7iZs/In/TQK+y3hFzxmiNn60CRRmrHbUxM4kecxN0bBbbJ03qSHrBHaBV8
         xg/j+maAD26DQTk8C6jiSeWhsgEomCWw57D9MMKGWWP+Hd8Dyjnho87iSU4cOJbU28ZQ
         vU3iNvPPjVy/PsJzq0OVpPQUWRfv1v4wDIfAXBpNVHSFUxfFwzLscb1en3cMGtsthre/
         HYQA==
X-Forwarded-Encrypted: i=1; AFNElJ9IbahLntrr7vU6ZwHHOUm9HlImPNjWLOy2ZDNuYfS5d8ovHNRdR0+Onzs1rZMuaChf0oNz3Os3E2km@vger.kernel.org
X-Gm-Message-State: AOJu0YxPwDNYYOitinI66qQIlWzSshHZJ2fQUCuf7npB3yYe4WRt5/Vx
	TXZYr1W5Eqa9/aTs2Z8cFYYjDK4xRGmxZkqgAhQOH0J3LAMXPprqrTrvZ6okHg==
X-Gm-Gg: AeBDiesxVKO1AEvZuQpMXgbtXVDZ+yuncYYlc91M9VIlNdEje1Y61Gybj9OvvZrVPvp
	mWpTz+9o/1P+WCecTUkb3YwLivXoc4mSqzFTj/HaMCbdpxcavhpmTB7QNby0ECuosQS9Sl42AEs
	XhBGRX3QhZpGFvsVa/Wb54X3yFYziMbcX/Z/a0iTgQR3VDKSQdn0S7EKdubkR1dcaJeJigzFh3g
	GOGPLiKKdS+A5Zl8PaogIkpc8HXf3OzCkolxA294NZ+Fd360u3b0XUjXe091zD5WsPP/WKxWvVW
	kTZuCiKEONXHmo4qznuOeVEH8O9ueOR0MKrDt+gLxnh9D3hH2f8HxZ9r9iI1cuoMgVZmob8ZnlA
	2P4jKwqMb30YA7mXqKno7M3ACU/bj8l52dneLrP2e0LLUHi+NLnpj5qXrMO4SH1gFt+Dd85pmmO
	7rAkVNGO8b3f47eYrDH3P74dkrVtJ17QqSkfEn6ewT2e3vnXyOMkvmd06GHRUHIb/ZoWgsbVSDU
	/XKtj4R8htmnNwrfN2d32CnpNSfx9cnSqU6EYRKCYI5PXYrZOisa0oiOtE=
X-Received: by 2002:a05:6820:83ce:10b0:694:85a9:d898 with SMTP id 006d021491bc7-69485a9e036mr2719937eaf.23.1776782644356;
        Tue, 21 Apr 2026 07:44:04 -0700 (PDT)
Received: from smtpclient.apple (syn-097-077-028-210.biz.spectrum.com. [97.77.28.210])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69464e5e752sm8341657eaf.2.2026.04.21.07.44.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Apr 2026 07:44:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
From: "Steven R. Loomis" <srl295@gmail.com>
In-Reply-To: <CAEoi9W4L3WTVv5Hhiec8D8J=654h-p+Mh_Nd9bbm_cDyardsVA@mail.gmail.com>
Date: Tue, 21 Apr 2026 09:43:52 -0500
Cc: hugh@blemings.id.au,
 Steve Conklin <steve@conklinhouse.com>,
 Stuart Longland VK4MSL <me@vk4msl.com>,
 linux-hams@vger.kernel.org,
 netdev@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5880136B-67E4-4D7E-A64C-FFF5A3E4A56F@gmail.com>
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <CAEoi9W5o_twDPYMZDqajqz+UYJm5wOvAx+hUFefXmU=vUbOgtg@mail.gmail.com>
 <CAEoi9W6vTPPHh-NBKZcgmo7GKTecQw1UuZ4HjwNTzqvNXWC43g@mail.gmail.com>
 <7a9547e1-9958-4bce-8547-71a93153a0d6@vk4msl.com>
 <c412bf83-e8cf-4a3d-8619-63f68e108399@blemings.org>
 <CALJxBtX_T8sv11ank-arLfoVqJqXegi3D_ZT9ZFbMHkuf-2RAg@mail.gmail.com>
 <5549733f-c9d6-4bae-84e3-285a317ee334@blemings.org>
 <CAEoi9W4L3WTVv5Hhiec8D8J=654h-p+Mh_Nd9bbm_cDyardsVA@mail.gmail.com>
To: Dan Cross <crossd@gmail.com>
X-Mailer: Apple Mail (2.3864.500.181)

So, is an important next step, having a repo with *just* the ham items =
with its own build structure?  because there are a number of other =
modules in the repo mentioned:

https://github.com/linux-netdev/mod-orphan

--
Steven R. Loomis
K6SPI


> El abr 21, 2026, a las 7:06=E2=80=AFa.m., Dan Cross <crossd@gmail.com> =
escribi=C3=B3:
>=20
> On Tue, Apr 21, 2026 at 2:28=E2=80=AFAM Hugh Blemings =
<hugh@blemings.org> wrote:
>> Hi All,
>>=20
>> Just to note in this thread (top posting as it's a bit orthogonal to =
the
>> rest of this discussion) that events have preceeded us somewhat here
>>=20
>> A patch just recently submitted removes the AX25, NETROM and ROSE =
code
>> from the kernel moving it to the mod-orphan sub tree of netdev
>>=20
>> =
https://lore.kernel.org/netdev/20260421021824.1293976-1-kuba@kernel.org/T/=
#u
>=20
> Wow, that happened much faster than I had anticipated.
>=20
>> A shame but perhaps inevitable - but I think we have a good plan
>> unfolding to both take care of medium term maintenance of the kernel
>> code (in tree or out as it may be) as well as a move to userspace in =
the
>> longer term.
>>=20
>> For the benefit of the netdev readership - we had a thread over in
>> linux-hams on this but that may not have been visible to folks in
>> netdev.  TL;DR: we think we have a way forward but appreciate this =
may
>> not be quick enough to meet the requirements/concerns put forward
>>=20
>> If we can delay removal, that'd be grand, but appreciate that moment =
may
>> have passed.
>=20
> Personally, I think this may actually turn out to be a good thing.  If
> nothing else, it's a forcing function for the ham community to get
> serious about providing an implementation that works well, and in the
> short term, an out-of-tree module can keep things working for folks
> while alternatives are investigated and prepared.
>=20
> I appreciate that folks want to discuss timing, but it doesn't appear
> that there is much else to be done at this point. It would make sense
> to continue discussion of alternatives over on linux-hams, sparing the
> already-overloaded readers of the netdev list from the sordid details.
>=20
>        - Dan C.
>          (KZ2X)


