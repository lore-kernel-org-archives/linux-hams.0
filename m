Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17F35CBD6
	for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 19:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776799809; cv=pass; b=Yn+hCEY06R3M/0XZegjTOD4SPHM2lOQUPKoHi7Ny9g/h9A33qHNqrqsgZQ6h+mReZyCyMNTs7t1nDBJFWC/EyBMsnSNHS37jF3e1+jrx0sO8zawFttXnO1El4swThUk+NVmY0Hi/zfGnvDMlK8/9V77X1EKOZ4DyW3E3+b56hDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776799809; c=relaxed/simple;
	bh=N5fZF8CkCrd3qUAy2TCkjLDzQ1gAwm9/892OuelukdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efvKTJMmDNOF/WZexmBQgHlWvhfN68Y59zaGdrsXR0/cn2TgheM0KJOQ35QrahcHua2l2rk+x+nrixHxguaMeE7IwY52wSFydHcCfhNBJerd2A5yrLkaju1ZcTwv7TOIiGGfkvDFA4m1a5vAlhJ4m/8OeK6IWLsq4bTQD7vk9tU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScH6Mzcx; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScH6Mzcx"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7b4ee3a88e1so43856207b3.1
        for <linux-hams@vger.kernel.org>; Tue, 21 Apr 2026 12:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776799806; cv=none;
        d=google.com; s=arc-20240605;
        b=bftdSh4j4lm5kMUI+9IaTp5LNCNphdu9u5P/y/kZ8pJRZlnqGv1FSadF5nLWSr5TqC
         myMuEbFwuihGI95PQcXS8R+sBFe3pGLWNiT4pdKhFuShUiipNVxkpQld8Dsv1hTjOU4u
         Tt7rxNJ7aVKE4BxYds+jKk83GuzTWqpkYUDbXZtT5MhPXioQtUdPkazT5e4Kumg1w/9Q
         lw3HXWXBvisFCLK1fmRGeSEtXeFrbCFBSSP7u8WKbt0hLQ6eb3N89zNiAHBrVJ0FkS5v
         cj8yK+bB1kBDaJzWvJEgqvdXjJOafk/MgS4w1Y1K3S99KNvvhnNfxL1h/nU+6OT9pc+7
         RTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vmzmon6xkN1BYJyKIqwVN6hvHewdF0EAVGyKgBC4qfA=;
        fh=X7MlD3YhvafqvZakKe7c2oG5MAzgBxCbukxeAwuill8=;
        b=R/71xOwpANy7YD6TRZrXjPjPnBmJkSBaUMQ9qetwk2caQzmG2nY71xbhjsKGb5iFNC
         ctcXipCUcNGefE3Zk7GngsOcTJGZNam/MgsxCJhkqox+SHEYbCppKK0AkZe6jFLRnB4C
         7WM5JTW8it7AC8iMdzqPos3kbLCHp0lB/ueGwlUWtt8MkUC8GgJJjkCPPokNbwJbTfQ0
         cn7WaTgEORaQHVpQVb2SnRGskU1ztHNm6Ugd/UTM3jRIvZK+RogWH7wykUUCkpPPSNAa
         HWj9irb6ZbeTG9yf6o2TjZFwDGwbZGo41xoEn8e5OST3ChVN3sVVxPQcVfXof82tytUJ
         e8+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776799806; x=1777404606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmzmon6xkN1BYJyKIqwVN6hvHewdF0EAVGyKgBC4qfA=;
        b=ScH6MzcxaO80MlVjdMF8dGGL7EDgP2LXjncgKHrTbD19C6uQmX8s7sO5ysWfpj9qs6
         OLuXzVkhfhHOuVaTB8hmcB1gJeRLVo2braFL6h95J3JGGx36BRNbuSgPhi4E9OJXx+pN
         ujsFmem7+tdT4FP3NULtgqJ/9xrY02xv/5TUBc8azwLd/XRaTBBiYD0gqJlmt8aGAHTn
         GVfRrryslO7hxQLo3ZEAzJdreMvsZH0movI/MDJIpDYd2yxrwxi5OnJyK94SImptaT1m
         ZwgOrQam+EOh4WRDTWGw2Bdk1mFvK8NQH3iV+uHfI5bVqkDgybWJtKqyinsmI+Urwp09
         MmzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776799806; x=1777404606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vmzmon6xkN1BYJyKIqwVN6hvHewdF0EAVGyKgBC4qfA=;
        b=JaeelZcilbXb7wp7fIAMOLtOQRqQ6FCnPKRwHdB0JwVWHQqDu93SnQcbcG+IUbybDs
         gtRvsvKb+ZeV9AoHkgqPt4A9CUSDuiROuoA3tkjRBWtV2OPVPI5L/4xLew7tR2+ZV9bi
         /0a09kfJDgGOwQTk1cFEVF5YUWUQXGlBORKHZTDxP90bo4TvK2OD86qIPm6hQjColHDj
         lwv1h9zj+a1QshwyIccbDmBJYmrGzSgP3n6vleBnI0OylAaTr8sPcADzTTYrR+80bCeq
         +fHc56EnLVLUcb9lVQK1EIkEBdUUesfLxypKw06ch3LKEzrlYZCaEHFIXxZYDVM5YqTU
         ph1A==
X-Forwarded-Encrypted: i=1; AFNElJ/BomQl6l6M77nirpd9DoNX1pKkXiS+/VvFauwy9iJ3Vc10OjWyUhOPxAhgoAwOjjFHhkeHr2o0jJEH@vger.kernel.org
X-Gm-Message-State: AOJu0YzsnsQ4runwqjV8pAORm8mRc1pI1pZboNV4EkcXNwR7aJJjqIML
	d4hSFhQ0psuKghZUXRKNxK4HI9bcYHA0wVn2Ew6zepQmcibwre42bi5Y+ElujMnsk2DyZldGPJk
	fj7sO+6BI5lhlDD0tjxvPaaRmh74Xg20yrk8k6kQ=
X-Gm-Gg: AeBDiet0PMxfPcrrK6GxLm3VEk+d9rb8bLEVVzVgvEG9HFQwi0B+nMbrP7jDwgtfRAR
	PnwlTIpMITkiWEN9I4pcHzU3uGMj1myqm5Xi6AZ4UAuE0C8uMZTDQD0MbYD1PJt836HqFIZHZ44
	3F4/k8A2P0PR5EZVJUpyDA03K5zG17vM2jhe1lKmFdcKSHOggDJJStbYIDQbs0NDzP+dmpckcsC
	mcRBTCdYup297nrc6NDtC5VmJLtcNW3vIKsZFDUFqTQbIqQ1sCiyjIyEhc9oRMAnSNyXqG5i+yy
	QqqesIsIgUbZWajerfSqUoDZEaugJlKSG0/JGDxABPyQcieTvNqtWgs01ZV1Tja7JaScrUIVH+q
	0OyknXhUNSPxjZW7qiHLjdhcbVF/NTZrsPxooq5XPtwxWYGg=
X-Received: by 2002:a05:690c:c511:b0:79a:b272:f933 with SMTP id
 00721157ae682-7b9ecf96b25mr196758707b3.23.1776799806464; Tue, 21 Apr 2026
 12:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <54da3df9-6c91-4df0-87ff-1975d536761d@blemings.org> <07d8ced7-fda8-9471-351d-6416f089d3db@trinnet.net>
In-Reply-To: <07d8ced7-fda8-9471-351d-6416f089d3db@trinnet.net>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 15:29:29 -0400
X-Gm-Features: AQROBzArPfDMRna5UBKJ9h_g4jdYEHiQn5Vto26WHcjvwrA27kx74RFQ5kc2cOk
Message-ID: <CAEoi9W5su6bssb9hELQkfAs7-xicCrrS7A4_Oo9K8but-jav5g@mail.gmail.com>
Subject: Re: Discuss: Future of AX25, NETROM and ROSE in the kernel ?
To: David Ranch <linux-hams@trinnet.net>
Cc: hugh@blemings.id.au, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 4:37=E2=80=AFPM David Ranch <linux-hams@trinnet.net=
> wrote:
> > [snip]
> > There's also been some very good points raised in that thread by hams
> > around whether it makes sense to move the implementation into
> > userspace or to out of tree kernel code. Both can be done in such a
> > way as to cause little to no impact from the actual application code
> > that makes use of the protocols.
>
> I've done a little bit of research on the LD_PRELOAD concept and it
> seems that one major gap here is compiling those tools and their
> dependencies.  Specifically, if the AX25 headers are removed from the
> kernel tree, some if not all of these libraries and/or programs will
> file to compile.

For things like this, usually the compat shims library provides
whatever headers are needed to build the library. It's common for most
distros to split things up so that package managers provide both "foo"
and "foo-dev" packages; the former tends to be runtime artifacts
(e.g., the `.so` libraries) and the latter build-time/development
artifacts (headers and whatever else is needed for building tools and
things).  Bottom line, I don't think this is a big obstacle.

> The key dependencies consist of:
>
>     - the libax25 library compiled which requires the AX.25 kernel header=
s
>        - My preferred source (more up to date):
> https://github.com/ve7fet/linuxax25
>             or
>        - Original AX.25 userland repos that are a bit stale:
> https://linux-ax25.in-berlin.de/wiki/Main_Page
>
> To solve the maintenance issue, there once was an ARDC grant (
> https://www.ardc.net/apply/grants/2021-grants/grant-fixing-the-linux-kern=
el-ax-25/
> ) to have someone take on this responsibility but the person who
> originally accepted the grant, backed out and that need remains
> unfulfilled.   I have also considered proposing a grant to rewrite the
> libax25 code to offer both in-kernel support but also offer the ability
> to translate requests to a remote AGW/PE stack and remove any in-kernel
> AX.25 code.  That could be an excellent alternative but the current
> defacto AGW API interface is limiting and either needs to be extended or
> a parallel control interface needs to be implemented.

It seems like upstream has made the decision to remove this code from
the kernel, and to do so on a time scale much faster than I,
personally, had anticipated.

> > If the consensus is that trying to keep the drivers in thee tree up to
> > date is the way ahead I'm happy to put my hand up to do this if no one
> > else is so inclined - I've a couple friends I can bug to help me get
> > back up to speed.
> > But I'm also mindful there are other hams that have been more recently
> > involved in kernel work, so am going to give them a gentle nudge
> > offline too :)
>
> Until some *real* options exist, I would dearly appreciate if you'd be
> willing to take this role up and I (as well as I'm sure others) would be
> happy to help on the testing side.  It should also be noted that Dan
> Cross's comprehensive post did highlight some keys points as well.  The
> Linux AX.25 v2.1 stack is behind the times as the AX.25 v2.2 spec added
> several valuable improvements.  A few userland AX.25 stacks such as from
> WB2OSZ Direwolf, G8BPQ LinBPQ, VE4KLM JNOS, etc. have added AX.25 v2.2
> support, FX.25 FEC support, etc. It would be great to see Linux natively
> add them too but maybe Linux go even further?

Probably the quickest stop-gap measure is to take the existing code
from the mod-orphans repo and get it building out-of-tree, then one
could just load it and continue as before.

> Ideas like adding native
> Flexnet routing support would be an excellent addition.

The problem with FlexNET, specifically, is that documentation for it
just doesn't seem to be available.  I tried looking, and it's possible
a version in German exists somewhere (I neither read nor speak German)
but I couldn't find it.  I went as far as looking for old DCC papers
describing it, and some exist that describe the major ideas, but
nothing with sufficient detail to do an implementation.

> Ultimately, my preference of in-linux support is all the fantastic
> routing flexibility that UNIX is naturally good at.

What flexibility are you thinking about, specifically?  A number of
places (hyperscalars, HPC) move networking out of the kernel for
greater flexibility or performance.

Importantly in this case, the Linux AX.25 stack never really took much
advantage of most of the whizbang features available from the kernel,
and it's not clear what utility some of the more advanced stuff would
have when applied to amateur radio protocols.

> I suppose that
> userland could do this too but when you might be running multiple AX.25
> userland programs talking to another Userland program acting as a
> router, I imagine things will get complicated for totally different reaso=
ns.

(It sounds like you might be referring to muxing AX.25 connections
between userspace programs?)

Multiple userspace programs handling one or more logical connections,
coordinating with a server of some kind implementing the lower-layers
of a protocol, follows a pretty well-understood implementation
pattern.  The same techniques the kernel uses to map file descriptors
to such connections can be used in userspace: each connection is
represented by some token that maps to an identifier that uniquely
identifies the protocol-level connection in the server; the actual
mapping from identifier to such connection is just a some kind of
associative container maintained by the server. As events occur (data
sent, data received, timers expire or are reset, control operations of
various kinds) those connections are looked up, logic to handle the
events is run, the connections might transition into new states, and
side-effects (e.g., actual transmission of data, or re-arming a timer)
are emitted and acted upon.

        - Dan C.
