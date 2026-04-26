Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1610BA34
	for <linux-hams@vger.kernel.org>; Sun, 26 Apr 2026 03:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777173443; cv=pass; b=SYCIojaekHJ3SOPzo6O8Q0td9VKJgQ3psp9R7x60C95uo8qBh5X8crDJoGO9DpT2WEJrHNWJLZ5lUndG65ZK1KMwYgE052VEsFWlaVorq7yFY9dy0kQierjrJ89RAT5zIXR9RWUIxJvp8SMVGQ2BFoCAWxKZWUkSYoVtnKWeG9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777173443; c=relaxed/simple;
	bh=wwuVSUUgRfBW6KLCvPs1eEFWu/ju0MkJUy7bxg2YYNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=iDKQB64VytF15yhLWdbWgvVpLQPr8JLqbr/vysX+wbvg3xGNxHgDNPVWIdOr9fnzqByy0vi9i1ZeHlAgJqlggZAOGziE4U0fPdcIDGn+Bikh+XWNQWSeaJk9vgkpvoLL4sTZqN9wsXK4LIuqwbrGFiBH4SVu3rfpuBii0u2CHlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmtech.com; spf=pass smtp.mailfrom=tlmtech.com; dkim=pass (1024-bit key) header.d=tlmtech.com header.i=@tlmtech.com header.b=Uy4Vowvy; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tlmtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tlmtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tlmtech.com header.i=@tlmtech.com header.b="Uy4Vowvy"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dd73b7c757so2295944a34.0
        for <linux-hams@vger.kernel.org>; Sat, 25 Apr 2026 20:17:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777173440; cv=none;
        d=google.com; s=arc-20240605;
        b=iLFbjZoKlLalqUu+V3ez+a55e0q+uumZ1bWKem+fMa8+otqlKx2+I50dUz4xGsaGEZ
         k5BmqoaaT6g/L7vi/GFBvowIa7ACAZxyYB7lH4u1mTYGDiIcX2dIbEhOBMqizM+ykJjR
         hMLtS0f0wi9477SyRWjbTggXmgAH40JTZXxKJyOIBdB4ECI7DYavQGd1H9qUNrs/Ir97
         smIgj9VuIpSvg4Vj5oHZISkZUfSECtmaMDD/BEe3b85H7uDsWiEJqa+r87fQi2SByMLF
         TER/MPhQxis9DqikbmGlHReNbVdqZimQap4Ka8qfRS+9msoOqKmeBHvfThnXR+wuyXia
         2QvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4tgfO+0e423OtwkMM5X9xZUhG2iqqB4OoSZYjltwl7Q=;
        fh=yvyQ0fNR7evt9jL2wClrmYYCzRjxmggS8kmKCqDY7Yw=;
        b=ONDqVjI/P7i40sLdNtXfQSRWvKzWwqxxDX5BgIfiVB+U3TkjzVfgMkwkLTXHuGW5hS
         0mf1s8K51S6ln9vn/NThUYAsJUs6NTQDjG/OmgV+6ZLf8XB/hweVTKgcPZM7Opv6SfJy
         d+VcbP3rv4OBQ/C1udaRRnMUNvZ8mLZO2AlO5uq5YGzYFuTzcjRgd7X+e2DbBHheBvLc
         eFk4y+2e9YpDhlJxUU+FRdIhUYDsSXNcwdp2/aWcLEZgrUc9+/+/1JNbKP9hGhzWw3JW
         XgGc4qE413EPuvZ7eSk87No3/pLOgFM7StxBLTYdLelK9KJ0tBdVKpst8gabdesjYN0Z
         HTdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tlmtech.com; s=google; t=1777173440; x=1777778240; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tgfO+0e423OtwkMM5X9xZUhG2iqqB4OoSZYjltwl7Q=;
        b=Uy4Vowvy1uJL1oWQoLwHkwz9fuikZYuIYwumWhXRMbZNqxT07H+AGIt2D5Wm2G+7/9
         3FybHW1KGbH7JJVrDFj7rU5TLvB4bniThdV+Vjxmo5Vx/s7omggzFezB4JODL6FOSy3I
         A6tEHKdWaOCjOv5dTfNHB45fQfvT5Au17RQak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777173440; x=1777778240;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tgfO+0e423OtwkMM5X9xZUhG2iqqB4OoSZYjltwl7Q=;
        b=g1saryJjqULRZJpI+Ub4bGF7RhL2dHKBY4TCPCRNnob/b4RmB5xfrjRv7NeaBFZczh
         VCMddP+UNH3+RFt7KIkzb2oYKok2AmteijQWgwJIwNLGMqP1blAJAy1SOzbQ/vtwBn7/
         4B7Rkqxbkg9K0BR74/uZOO4+6R6YLDeMNxNPiBvrgoTxbijqZz7HeLkEkBdMe51c2jEm
         VABnUiIFu1pKfYB99Cj82OS6XR2uV70hmpew4kCA+XjbQmOY7DSZsfOJZa1WK0rBZt/A
         eBLLq6emIHcWuz94P0eMlrNKNOp8PYjC/ZWco+MED35cmABYyph+ODouBLvQ96g6/t+I
         eLoA==
X-Gm-Message-State: AOJu0YwBsprMdnBWHh2dmsqMKca0Mrb8rFhZPc57BQs//uH4bNjFlViI
	55envNQEufLzyoi/j8w8Y1N5q3BS+PgkklQMTaA+3CDFEovOy99t8fXF2w8z551XxyKunRjIN/A
	R98R5l8sKYZowC7u75t10LZVUbsrjOww2IM3Dh5/Bo4ovCMax0uwqnSc=
X-Gm-Gg: AeBDievSA7/JTxRbK0bgohmigJHJ/elWhXgPiSZd/uhktMruwT7kiqHReRVSNW/CCI6
	4NEwEifZfEpAr0EkdUO1FETzQIeS+LNlttFhAEd1Z2eZfzO9PSk30a9ytTFtX1REqefybAYa4Se
	zONgLJhHlvylqpIuQmqe8lykT34Fdyp0r4h7gKcpGHGufr8uc9H3VakPFqAYLLpyBAELQcrmvFU
	yyLktwKDhPudtEpY7/Kh7CCSC8nbJoGOmJtctEPeSlvJryxN5EurJHXZeMp/dAAReyvJOUnEnnl
	UA2cQWk3gYHXZUvAMQ==
X-Received: by 2002:a05:6820:2103:b0:694:9b71:3743 with SMTP id
 006d021491bc7-6949b713b79mr13869886eaf.51.1777173440545; Sat, 25 Apr 2026
 20:17:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org>
 <07d8ced7-fda8-9471-351d-6416f089d3db@trinnet.net> <CAEoi9W5su6bssb9hELQkfAs7-xicCrrS7A4_Oo9K8but-jav5g@mail.gmail.com>
In-Reply-To: <CAEoi9W5su6bssb9hELQkfAs7-xicCrrS7A4_Oo9K8but-jav5g@mail.gmail.com>
From: Joshua McAdam <josh@tlmtech.com>
Date: Sun, 26 Apr 2026 13:17:09 +1000
X-Gm-Features: AQROBzCVRnINd2Tk9AJRRZLpKgutcauJuqEP13cUNc1Izh0TuGvm1Xo-zHAk3k8
Message-ID: <CAPmVDN4+A2JNGO_j-8mYK2zGSfY+Fg-3Cbq66Qqxca4uOjBS6Q@mail.gmail.com>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 5:30=E2=80=AFAM Dan Cross <crossd@gmail.com> wrote:

>
> Multiple userspace programs handling one or more logical connections,
> coordinating with a server of some kind implementing the lower-layers
> of a protocol, follows a pretty well-understood implementation
> pattern.  The same techniques the kernel uses to map file descriptors
> to such connections can be used in userspace: each connection is
> represented by some token that maps to an identifier that uniquely
> identifies the protocol-level connection in the server; the actual
> mapping from identifier to such connection is just a some kind of
> associative container maintained by the server. As events occur (data
> sent, data received, timers expire or are reset, control operations of
> various kinds) those connections are looked up, logic to handle the
> events is run, the connections might transition into new states, and
> side-effects (e.g., actual transmission of data, or re-arming a timer)
> are emitted and acted upon.
>
>         - Dan C.

Hi All,

Like Hugh I have also been lurking here for a long time but this is
also my first post,

As a fairly active user of the Kernel Ham stack for decades, seeing
this discussion start is timely because I have been wondering how I
could help, as I could see things seemed to be slowing down and
approaching a turning point where action is necessary.

I believe many people still rely on the kernel stack for BBS's,
Digipeaters, I-Gates, Winlink Gateways and nodes out there running IP
over AX25 - even things like PAT for Winlink which has no native KISS
support, so it relies on Kernel KISS interfaces (i use this
personally).

If there is a way I can help with maintenance or even become a
co-maintainer, I'd be interested to learn more as I've written kernel
drivers before and patched things - but never gotten involved in the
mainline kernel to date.

While I am still fairly proficient in C and have written AX25
implementations for Arduino projects among other things, I wonder (and
hope I don't unintentionally upset anyone by suggesting this) if there
is an opportunity to look at new options like using the recently
introduced kernel rust support to rewrite / tidy things up along the
way to resolve many of the memory safety and many other issues that
have been coming to light lately.

It would be a shame to let this "die on the vine" in both the kernel
and linuxax25 given all the work put in over the years.....

Regards,

Josh M
VK4JLM
