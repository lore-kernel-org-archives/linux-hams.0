Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61665320CD9
	for <linux-hams@vger.kernel.org>; Sat, 20 Jun 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781959350; cv=pass; b=fH5c1+4YCC3xA4QpeHF9CcYG0V8ZgCNaVpatgd1UVkijD/guI5q1VMHUBUfoIBjZm/UQlxyIDDzYVQ/iVKO9t+bvswbC6FLujdynUdIstN8/CnBA4RjtaCYbLGcj9bIC+MCn1ZU+CGMaAvWmxs+kPOisabQnEVbAOaLvTr1NJcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781959350; c=relaxed/simple;
	bh=8UtZkE1qj9b82bRkkkebOs7Sc8Pv9kYTWQxgpMFXeg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSmwJCVomUvDhJuS7BJE1IApdcCUVXHf+ahdrakuc7HNcrxXPbd8KyIh2c+ENgfnLT6F/knB52qGNiDX6Sr5gPrxyoYszZ6vlbTRrzfaPmKG8UHGvbjN+RjKl/drNdLZC0T6qLa4Lxg3TnFK1xMqGCgYWTUlFBhWveng6AHLQjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pashVic6; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pashVic6"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7fdbd0960b9so24907867b3.3
        for <linux-hams@vger.kernel.org>; Sat, 20 Jun 2026 05:42:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781959348; cv=none;
        d=google.com; s=arc-20240605;
        b=imuorW5Yu+KqU1yMJZuda3YVYjDJAcZhBs+PaDDF3XA1/wYxOCPPB+dmQX2dTRRrNw
         8WhjE4C6/gMgBZPrH6JkI0mVqgtj8X8i0ltXB+prRFlcuUlis75XSMfMP7aXZ/45xwOM
         OdyjlXdseMZxH1NPqifFnRhRjEe4tEv29gtcEE34Wj2isU57UBjLH5weI73Gz9ofU3Nd
         jX3ujPqWjw1I5FJcd1fP2mNPhOuGPaSn1Y7M4UzMRrg7ZYBm3oWQ5uBq58nJK4IXHlOX
         mNZV6jbdyoKG32kekSAXawFdfqmagR8glJ9qccXIqIN/nRao4ukDz/kRpfMq71RkBl75
         pxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nEQ2JR83lz7mlI1Yc9K1ICN+Nzlj2YYOxiN77HJg7NI=;
        fh=e1tG7VIOv3yZbyglm47FqnjF6TdPIn64FecYFN5ItXc=;
        b=H2hdszopT+WFSOci7WJ3WzLgtVnnym6MtKUkdNW+WSJtra9cZcmOLkxlrZhMisREAt
         0lJoXpcCNGIaBjKpWo7C411qEVndwszscxzk2BAwmrD+5Ci4F1Jr1u3FzeobHNIMMTKu
         t8uXeyS2QkWFoZbYfv5nqz8mIyYdHduOO9WC4U0Z1gscOgAUd82yF/ehK/tclSTnEUgX
         /0tE+a0aRzFTPvF1W84QRIiMOh/5URGdyZ7NoJRTqfdWn9/uRWJ4C/qqeZHMfRSB5MeO
         wA/tOEZvicUX9ymSJTEwGDBaufA081gEPw5mQqAMVBiRn2Dsfc00HL96tWC7kSJ8E4PZ
         PDaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781959348; x=1782564148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEQ2JR83lz7mlI1Yc9K1ICN+Nzlj2YYOxiN77HJg7NI=;
        b=pashVic6hT7ZB6aw46HaL087F6A+EDSpiEmmkDjJ7t71zhdZMovVV6kGqN2Kw5EQ/G
         ejqbfx632yEvzEurEJ0ZkZwlRN2Q7c+nlUZxmESaQM2uo+OHsssMlr9yz9PPd9RAfhWH
         MmqKSmKqaNrtVX4i/AwMk/LjGBbsJJS41cusxrttjeDSyaLY120RLSz26cmzu5qzIPEI
         R3kP6pdm02e4znL/Shvs39TJFFpPMGh/gkUbFNhCQb+bQ29wonVaI8WfIAu63wKjfrLd
         BPsE3wjqz8zleKARu+ddFkMpRNi70fiKJJLU4uBq8VPZyjRqBUvy4559bKXGM1b3nOgz
         JzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781959348; x=1782564148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nEQ2JR83lz7mlI1Yc9K1ICN+Nzlj2YYOxiN77HJg7NI=;
        b=Yo3QNyY0kw2NBQXNrmcQZROVP5G/JJO4XDnDpm7Rd4XYvACPZcQfZLyoYHv9w8Adrm
         eA7QQRakM8KzK+fgH1pdDysNLegNaCoFZaCWS2xroFdlAEL5cIaeg7Jz6LQQNrA0wz8W
         KeHgQ+Ifzs6QNir9oGxYr8rOus7B+8DyQM6jn3czhnqfq2xVBpq5kKZs+ZabNf9QTkjT
         1AJHmJdCPIH+QCUFTMl2BpNHjVHbF1qTDs3+priqcw4Ka3NRz7qOOHE49SOPyVjzuKRb
         /26UniBF/vl3HL5vMBx05CsVgLZTovjwpNQk2kDO+E50n5i4lRZDkKijkozeIhQpaSgY
         mnow==
X-Forwarded-Encrypted: i=1; AHgh+RoOeGfVD8Ft4fpbC6e3Df1UpYk1QVodFR70cR5VWeT9hrZWn9/hrEl0P2BRLUvzOXce1YOOfwtAbzSF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1L+neEjQvkXzhqxJk58o+o7Z7vlmR7ZzCW3Pmm8QsWyz7v6ho
	CS2/1HQmSUbkWx7U5Ozp/mGYa8l1lbKZ1HhDiXyKIFxOufYjrZnv9smSTxm7KnWVe/2ZwqJGvdM
	hjX5FJAd02Qo4Dj1LOIgtCxKGw3KNQsk=
X-Gm-Gg: AfdE7ckdQAa46445pmbbl6g8fzcY/VDB/z0pm9jtITyPUZXDxFBORDUjFKuA1xITnb0
	lroAWYJNb5Dgkrl/NqBkP3o8DbLk0c013foJpizqAnCZ4QQcd0DXDvOcKLahwEx5c79bxmwTW2g
	yUgrazIPlVr7wsfyx39XUAo14/fyQKY2dawrqzAPH5TOqF2h7DAmORVX06x8Y93uQ5FS87WfN24
	KkXHuGFmS5HAeYavrRrC17RmXJ8s7y2FEU/MS3iPKaZqI6tOEvLAyGFlqGQiZ2UxvpP84XjirI2
	wY0OPKE=
X-Received: by 2002:a05:690c:4984:b0:7fe:200f:e7e0 with SMTP id
 00721157ae682-80138141211mr81116397b3.36.1781959348280; Sat, 20 Jun 2026
 05:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YBfk2UOjAktrLq3_9+563m6UZuKv9XdBjfp2aB1twV1HQ@mail.gmail.com>
 <2026061625-starless-mascot-691a@gregkh> <CAFAa3YBciYSJxDT-SH=4oppyBS3hWUSEwJP_86EgUriJfYkjLw@mail.gmail.com>
 <2026062048-posted-scarf-dcf2@gregkh> <CAFAa3YAEDsnqcN6UqUE-4X+y0t7RPmNtwdb0LxExryZmAKU9pw@mail.gmail.com>
 <2026062051-doorframe-crayon-d390@gregkh>
In-Reply-To: <2026062051-doorframe-crayon-d390@gregkh>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Sat, 20 Jun 2026 14:42:17 +0200
X-Gm-Features: AVVi8CeqdpNwGHrorykGXuC3-bncaCfxQ5vPqHg_WEnzQVSupw-FCxTEi87GX2E
Message-ID: <CAFAa3YCJXV9uW==2776dbfNFH4PhBPUYnTxDJ2xs7kn0b=4UTA@mail.gmail.com>
Subject: Re: [stable request] ROSE memory-safety fixes for 7.0.y and earlier
 (merged out-of-tree in linux-netdev/mod-orphan)
To: gregkh@linuxfoundation.org
Cc: kuba@kernel.org, stable@vger.kernel.org, linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Thanks, much appreciated.

Short answer: yes, the same series applies to 6.18.y, and the same bugs
exist in the older trees too -- but only 7.0.y and 6.18.y take the series
as-is. ROSE was removed in 7.1, so every stable line up to and including
7.0.y still carries this code and is affected.

I just test-applied this exact mbox with "git am" against the current
ROSE files of each tree:

v7.0.13 : clean, 15/15 (what I sent you)
linux-6.18.y : clean, 15/15, no conflicts -- the teardown code is
identical to 7.0.13
linux-6.12.y : applies up to patch 3, then conflicts in
rose_loopback.c (the loopback/timer code predates one
of the refactors the series builds on)
linux-6.6.y / 6.1.y / 5.15.y : same, conflict at the same patch

So for 6.18.y I can send an identical batch right away. For 6.12.y and
the older LTS lines the fixes are still needed, but they need a rebased
backport rather than a straight cherry-pick; I'm happy to prepare those
per-tree once the format is settled.

My suggestion, matching what you said: let's land this 7.0.y batch first
to work out the workflow. As soon as it's in I'll send the (identical)
6.18.y batch, and then the rebased older-tree batches one line at a time.
Whatever order is easiest on your side works for me.

Thanks again,
Bernard, F6BVP


Le sam. 20 juin 2026 =C3=A0 12:52, Greg KH <gregkh@linuxfoundation.org> a =
=C3=A9crit :
>
> On Sat, Jun 20, 2026 at 12:37:16PM +0200, Bernard Pidoux wrote:
> > Hi Greg, all,
> >
> > Sorry about that -- my mail client dropped the list and Jakub from the
> > recipients on the previous message; I did not intend to take it off-lis=
t.
> > Resending the same note to everyone, with the mbox attached again.
> >
> > I have prepared a first set, attached as an mbox: 15 ROSE fixes for the
> > 7.0.y stable tree (7.0.y is the last stable line that still ships ROSE,
> > since it was removed in 7.1). They are the use-after-free, refcount and
> > teardown-race fixes I developed and merged in the linux-netdev/mod-orph=
an
> > tree, where ROSE now lives.
> >
> > As Greg asked, every patch carries a
> >
> > (cherry picked from commit <id>)
> >
> > trailer pointing at the exact git id in mod-orphan it was taken from, s=
o
> > they can be tracked across releases.
> >
> > The whole series applies cleanly with "git am" on top of v7.0.13 (no
> > conflicts, no fuzz). The 15 fixes form one coherent set -- the three
> > core UAF fixes build on the earlier refactors in the same series, so th=
ey
> > cannot be cherry-picked in isolation; this is why I send the full set a=
s
> > the first batch.
> >
> > Please let me know if you would prefer a different format (individual
> > mails via git send-email, extra trailers, etc.) and I will adjust. I am
> > happy to follow up once this batch has gone through.
>
> Great, does this series also apply to 6.18.y and/or any older trees?  Or
> should I just worry about this branch for now while we work out the
> workflow?
>
> And at first glance, this looks great.  I'll try to apply these on
> Monday and let you know how it goes.
>
> thanks,
>
> greg k-h
