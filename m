Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50703624D3
	for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 17:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086314; cv=pass; b=QPP86kU8/RP/wzYPhrLCsiwC9ye0V75uxowFKYXoJoGWnosyegYopw7OpouK6KNPS3Bm+0oKU5tA7Fgol4DiAVaG9di8Ux53tIP5D/HPmJWATuOLJFEx/kCiexc3/pUqgYDuJjoyYj5r89+9BXlAPxB4SxBuNBxESPkfrI5gNUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086314; c=relaxed/simple;
	bh=jSTWjx3Al3rxE6vCDBGumRjJAYtvcIyV1qqGa0AAMTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDoA0lrAXOs9BtA66B0eXnq6oLI0NLRNSWzzyBVs73+EHOOu+xpo7oXSAT8rIrpyG3PlDGM36gmVcw736WCLA2KDPMBy4LkD/Qt4DPUIBQfoVknGOrIpm9lcVsIy5fG0vuFTtRaGG7TMcPlKPhtzun08jV52oDvMLu8jYBIq06c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7pXCmM9; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7pXCmM9"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67489c8202cso1904310d50.3
        for <linux-hams@vger.kernel.org>; Thu, 15 Oct 2026 10:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792086307; cv=none;
        d=google.com; s=arc-20260327;
        b=pyjbXVtJ+qB359Fk3G04Ltf9/eovbSShx6iIw0BQHx7TlhZd/shlpFLKoXBwP5GA3w
         A7Z2XWUFdJaYpf5EuHlCqz+VBwvmjInM/aWAWSOtgHQpWK3CmuXH0belRl2OwNNU2C+R
         3iqtWT3N5DCUAC3rWnWJdeGdraW3VliMmDcPqs5ACT8ygNvVERu0xUsqvHUq5zbUFD1Y
         2qnklOgVmoKYcW5JAxSS97OdJ6e0o1mjNSfdCXXoRwMa5B3SMmXRMGsypJAgvIt/fN0Y
         fE7oaRLTkGTjr2TGQMlJweKHjlEyTieZWL82R4BvJ9R83milJL1OJ8nwyn4fo6P7nMju
         qujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w2Uw0XVJ2XA67jG3oT6+/rggLIqDTtUOtSG0vQSbvCY=;
        fh=Su3QtX70+yAWarwvyBxaE3rwmtekL6Cn6/lSEnFn1O0=;
        b=lSjlXhuBHtPYhiZ6UAegpFuoJJJGgl+C+UxlfV31sqFKBmByc5rpidfI+hde7AO+5c
         8gK0pl/NUhsPrvuBqmOX+iMxR/Qbm7qtOobvFfATryPj+EK0CTLL4tfmnXUjTFLbuAFU
         U7dbRrsuVcoCXra8gQ8ua3u8TgtLPztPVwAqxg50O90qAmxb+BcJHWKsZ7e8YfYn1JSi
         XBJ9MGel/67KVTtnIlNhytslyBs+GMa6u/UdHZ7eniRcRiTyhMw01WNa2OF3N0ev+ZKO
         Gv/nuyIAspTcBEFM8whO6FDe9xVZT1ZOvZngB8Rok8lm7RZGIyC7HFHnR1Yw6hd237JZ
         Iy/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792086307; x=1792691107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w2Uw0XVJ2XA67jG3oT6+/rggLIqDTtUOtSG0vQSbvCY=;
        b=F7pXCmM9SEn2ZS1ABoKspPD5BWPDMxa+3hByfamRt6YCENjzonxojfRO3Lwsgn/vQ7
         jk8VUx5kA7+5s5OJiFQLE0+EMNWla/V75zJpv/tTiWE4GLEqxghZYAodrnM9f+f6u5vF
         e634G6kQ5IGbXNwPpqJC4WCTmQCQPiCaPAYZWA2KOE+Osx5ayNMw8j0YG1b9q5jMiwy3
         UWjeFR5CUuBLyEU02pC400KxcaK6iIwlKGkjgzJhvwdib5Q59Bd5eIkVNde1J4zosSZY
         h3yiiZlyBtLqp9LutFpe3m94FPeB5QQgVGa6FfgnH/3zTif+nAZex1jfLJB2SrUOO8jw
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792086307; x=1792691107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w2Uw0XVJ2XA67jG3oT6+/rggLIqDTtUOtSG0vQSbvCY=;
        b=k01nfpfuDJ0HY3Xe2g/6s0I0BJiZ6ug/l6ScaImK4DVYTPdZTaBCFV92fVjfSgQUod
         4R71DAyegvJkWoupvU/aXLxecT2c2eNLGaymNS4BJlXxV7bHOd8AdssRfyp+6+E8y9S6
         W5xL9j6mZuG/XWn6H1iQFoacHOk6p98fnF0JJ1hxwG4awVyvYjdQFQIczMYzDB4l68jy
         8le+Ts/XT9ddWbgX/AG+FpkieYZYU5ZzSpTBCTrnmsc3Xn3ZBT1MQ0FW5PNTWt8ycGTQ
         U+K6ok8JilQUfPTN7M7fPQrZGFU93Tn63U6njE06eByH6bOA3fRw8eK4A/4rJW67Z1wc
         GMhA==
X-Gm-Message-State: AFq9FYKD1tpfjoYk4zTHoVIJWOKDh+qfVBGm7ODOwUWMPHFtpiE+eJc6
	84X1+rd4JbZYluWXYlm+hbduq+MC30YuWh+5HnEa3HLb9/u1KtQ8b7oV1UpRbCf2R4IAp1UTUeZ
	VdSPROXmP0H5d/6qluA/HVzUjwtMu8+OTrNMU
X-Gm-Gg: AYBFou1ctCb5zvf8ZnEHNkPs/mj9YAV11E3NNQNjLjEoGA6h4Kk9W96klTIOfRe9ZnD
	5KoINGgTm/UjD9GMbEAfUXmVo94h5ApeqzshkXfoEI72f+mCTZ8vZsAFwTQn/ECrmLfmlb0se/+
	BXf/WZc/BxokXxyCcILq35LemSCFwPTqZACLMn2zzbV0kxSlhSBV9JQJ9m1mV3hutPwsydRxTog
	v17RjFIw76JBuLthwdpBjHp67iXTb9VLNKRH1VSFG2tIYeF5QzKXifAEPmVm650hR0cOoTDLAv8
	7F3FX/35Vdp+JnTzBkH/yYiyrJwHgQ2xbyD2Unv9lI5yu5Lzj7P2PMk=
X-Received: by 2002:a05:690e:128d:b0:679:8dcf:74ff with SMTP id
 956f58d0204a3-6798dcf7631mr2353431d50.15.1792086306401; Thu, 15 Oct 2026
 10:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hams@vger.kernel.org
List-Id: <linux-hams.vger.kernel.org>
List-Subscribe: <mailto:linux-hams+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hams+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFAa3YCbFFNNWLwDEd6u7dGE=5xfb72CSLwJgJVAtP_+=8beDg@mail.gmail.com>
 <19B86BF2-D959-4D1A-81ED-8DADD729042B@osterried.de> <CAFAa3YDzx6XGDH0wL+=YYq7uGaccJkdT0a7UUYOiFrdu5WFL9Q@mail.gmail.com>
 <28347904-28FF-45C2-B7C5-0FF9CFF4CA31@osterried.de>
In-Reply-To: <28347904-28FF-45C2-B7C5-0FF9CFF4CA31@osterried.de>
From: Bernard Pidoux <bernard.f6bvp@gmail.com>
Date: Thu, 15 Oct 2026 19:44:55 +0200
X-Gm-Features: AclHuK-tmDCY77_I-3Y18BXv2DGqv24BK7ZiINOzMMjzHKomdaFVaH9dZaqBO5c
Message-ID: <CAFAa3YCJCDURH1bUAE0PAdMXVNzY2GgQGNWCX5q6grP=TGxJsw@mail.gmail.com>
Subject: Re: [PATCH] ax25-tools user_call: data dropped on a slow link,
 connect timeout that never fires
To: thomas@osterried.de
Cc: linux-hams@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Thank you for testing, and for taking the user_call fixes into your
ax25-tools tree with my name on them.

Your alarm handler change makes sense: ending the attempt from the
handler itself no longer depends on connect() returning EINTR, whatever
serves the socket. I will bring it into pull request 29 of the
linuxax25 tree of Lee VE7FET, so that both trees keep the same
user_call.

About your spoiler: an AX.25 stack in userspace is good news, all the
more since AX.25, NET/ROM and ROSE leave the mainline kernel with 7.1.
My own work is on the other side, and I see the two as complementary.
Many stations will keep running the kernel stack for years with the
kernels that still carry it. So I am trying to repair and secure it in
those versions: the 6.18 LTS series first (four ROSE fixes are in
6.18.55), soon the 6.12 LTS series, and also 7.0, the kernel shipped
with Ubuntu 26.04 LTS.

I look forward to reading more about your roadmap.

73 de Bernard, F6BVP


Le mer. 14 oct. 2026 =C3=A0 22:12, Thomas Osterried <thomas@osterried.de> a=
 =C3=A9crit :
>
> Hello Bernard.
>
>
> > Am 14.10.2026 um 14:51 schrieb Bernard Pidoux <bernard.f6bvp@gmail.com>=
:
> >
> [..]
> > 1. Partial writes
> >
> > You are right. write_frame() now loops until the whole frame is
> > written, as in your proposal, and still waits with poll() on EAGAIN.
> >
> > I could show the loss with tcp_call: 32 MB sent from stdin to a TCP
> > server that reads slowly, with -o 65536. The previous version hit 22
> > partial writes and lost 81408 bytes. The new one delivers the 32 MB,
> > checksum identical.
>
> Thany you for that test!
>
>
> > 2. alarm(0)
> >
> > It is now called right after connect(), whether it succeeded or not,
> > in the four programs.
> >
> > 3. -T <seconds>
> >
> > Added to ax25_call, netrom_call, rose_call and tcp_call, and to the
> > ax25_call(8) manual page. The default 0 sets no timeout of our own and
> > leaves it to the protocol timers. As you say, this is how ax25d and
> > node setups actually behaved until now, since the 30 seconds never
> > worked. A negative value is refused.
> >
> > You wrote "I'll -T": if you meant to add it yourself to the official
> > ax25-tools tree, tell me, and I will adapt or drop that part.
> >
> > Testing:
> >
> > - builds without warning with and without zlib (gcc 15 on x86_64,
> > gcc 12 on aarch64)
> > - tcp_call -T 5 to a silent address gives up after 5.0 s; without -T
> > it was still waiting at 40 s;
>
> On my linux it waited without -T 120 s (tcp default). Tested against a se=
rver with stupid packet-dropping firewall.
>
> > a refused connection fails at once
> > - rose_call -T 15 on a real node to our BBS over ROSE: banner,
> > prompt, and the session lasted 30 s without being cut by the alarm
> > - rose_call -T 10 to a ROSE address whose neighbour link is down:
> > "Connection timed out - aborting" after 10.03 s, no circuit left
> >
> > Still not tested: ax25_call and netrom_call in real use, and the -c
> > compression path beyond compiling.
>
> I did only test ax25_call and tcp_call. No netrom and no rose here.
>
>
> About the connect-timeout patch:
> I have to _spoiler_ a topic.
> I'll tell more in a few days after finishing things on my roeadmap. For t=
he life without kernel-AX25, I have extended libax25 in a way that it can i=
nterprete socket/bind/connec/listen/accept-syscalls and may pass it AX.25-s=
tack-capable programs.
> The alarm-fix did only work for syscalls like connect that went directly =
to the kernel.
> I had to slightly modify the alarm handler. See https://github.com/unix-a=
x25-stack/ax25-tools/commits/main/user_call
>
>
> vy 73,
>
>         - Thomas  dl9sau
>
>
